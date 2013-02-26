package com.cyanogenmod.settings.device;

import com.cyanogenmod.settings.device.R;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.EditTextPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceActivity;
import android.util.Log;
import android.widget.Toast;
import android.os.SystemProperties;

public class DeviceSettings extends PreferenceActivity implements OnPreferenceChangeListener {

    private static final String TAG = "S7Parts";
	private CheckBoxPreference mTabletUIPref;
    private EditTextPreference mDensityPref;
    private CheckBoxPreference mSwitchStoragePref;
    

	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.s7parts);
        
        mTabletUIPref = (CheckBoxPreference) getPreferenceScreen().findPreference("tabletui");
        mTabletUIPref.setChecked((SystemProperties.getInt("persist.sys.tabletui", 0) == 1));
        mTabletUIPref.setOnPreferenceChangeListener(this);

        
        mDensityPref =  (EditTextPreference) getPreferenceScreen().findPreference("density");  
        mDensityPref.setText(  SystemProperties.get("ro.sf.lcd_density"));
        mDensityPref.setOnPreferenceChangeListener(this);

        
        mSwitchStoragePref  = (CheckBoxPreference) getPreferenceScreen().findPreference("storage");
        mSwitchStoragePref.setChecked((SystemProperties.getInt("persist.sys.vold.switchexternal", 0) == 1));
        mSwitchStoragePref.setOnPreferenceChangeListener(this);

        }

    public boolean onPreferenceChange(Preference preference, Object newValue) {
    	Toast toast; 
    	
    	if (preference == mDensityPref)
    	{
    		
    		//SystemProperties.set("ro.sf.lcd_density", newValue.toString());
    		Integer newdensity  = Integer.parseInt(newValue.toString());
    		if (newdensity < 100 || newdensity > 300) return false;
    		
    		Utils.runRootCommand("mount -o remount,rw /dev/block/mtdblock2 /system");		
    		Utils.runRootCommand("sed -ri 's/(ro\\.sf\\.lcd_density=)([0-9])+/\\1"+ newValue +"/' /system/build.prop");
    		Utils.runRootCommand("mount -o remount,ro /dev/block/mtdblock2 /system");
    		
    		//Log.d(TAG,"Density: " + newValue);
    		toast = Toast.makeText(this, getString(R.string.success), Toast.LENGTH_LONG); 
    		toast.show(); 
    		
    	} else if (preference == mTabletUIPref)
    	{
    		Boolean mstate = (Boolean)newValue;
    		SystemProperties.set("persist.sys.tabletui",(mstate ? "1" :"0"));
    		//Log.d(TAG,"Tabletui: " + newValue.toString());
    		toast = Toast.makeText(this, getString(R.string.success), Toast.LENGTH_LONG); 
    		toast.show(); 
    		
    	} else if (preference == mSwitchStoragePref)
    	{
    		SystemProperties.set("persist.sys.vold.switchexternal", ((Boolean) newValue) ? "1" : "0");
    		//Log.d(TAG,"Storage: " + newValue.toString());
    		toast = Toast.makeText(this, getString(R.string.success), Toast.LENGTH_LONG); 
    		toast.show(); 
    	}
    	
    	return true;

    }
}
