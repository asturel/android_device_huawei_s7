package com.cyanogenmod.settings.device;

import android.util.Log;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.SyncFailedException;

public class Utils
{
    private static final String TAG = "S7Parts";

    public static void writeValue(String parameter, int value) {
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(new File(parameter));
            fos.write(String.valueOf(value).getBytes());
            fos.flush();
            // fos.getFD().sync();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + parameter + " not found: " + ex);
        } catch (SyncFailedException ex) {
            Log.w(TAG, "file " + parameter + " sync failed: " + ex);
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + parameter + ": " + ex);
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
        } finally {
            if (fos != null) {
                try {
                    Log.w(TAG, "file " + parameter + ": " + value);
                    fos.close();
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                }
            }
        }
    }
    
    public static boolean runRootCommand(String command) {
        Log.d(TAG, "runRootCommand started");
        Log.d(TAG, "Attempting to run: " + command);
        Process process = null;
        DataOutputStream os = null;
        try {
            Log.d(TAG, "attempt to get root");
            process = Runtime.getRuntime().exec("su");
            os = new DataOutputStream(new BufferedOutputStream(process.getOutputStream()));
            os.writeBytes(command + "\n");
            os.writeBytes("exit\n");
            os.flush();
            return process.waitFor() == 0;
        } catch (IOException e) {
            Log.e(TAG, "IOException while flushing stream:", e);
            return false;
        } catch (InterruptedException e) {
            Log.e(TAG, "InterruptedException while executing process:", e);
            return false;
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    Log.e(TAG, "IOException while closing stream:", e);
                }
            }
            if (process != null) {
                process.destroy();
            }
        }
    }
}
