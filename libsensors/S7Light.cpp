/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <fcntl.h>
#include <errno.h>
#include <math.h>
#include <poll.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/select.h>
#include <stdio.h>
#include <stdlib.h>

//#include "PS_ALS_common.h"

#include <cutils/log.h>

#include "S7Light.h"

/*****************************************************************************/

S7Light::S7Light(char *dev)
    : SensorBase(dev, "sensors"),
      mEnabled(0),
      mInputReader(4),
      mPendingMask(0)
{

    mPendingEvents.version = sizeof(sensors_event_t);
    mPendingEvents.sensor = ID_L;
    mPendingEvents.type = SENSOR_TYPE_LIGHT;

    memset(mPendingEvents.data, 0, sizeof(mPendingEvents.data));

    open_device();
    unsigned long flags = 1;

    if (!ioctl(dev_fd, SENSORS_GET_LUX_FIR,flags)) {
//        mEnabled = ioctl(dev_fd, PS_ALS_IOCTL_ALS_GET_ENABLED);
        mEnabled = 1;
        setInitialState();
    }
    if (!mEnabled) {
        close_device();
    }

}

S7Light::~S7Light() {
    if (mEnabled) {
        enable(ID_L, 0);
    }
}
//        input_report_rel(po188_driver.input_dev, REL_LIGHT,  po188_driver.voltage_now);                 ^M

int S7Light::setInitialState() {
/*
    struct input_absinfo absinfo;
   
    if (!ioctl(data_fd, EVIOCGABS(REL_LIGHT), &absinfo)) {
        mPendingEvents.light = absinfo.value;
    }
*/
/*
    int val;
    if (!ioctl(data_fd, REL_LIGHT, &val)) {
        mPendingEvents.light = val;
    }
  
*/
    mPendingEvents.light = 0.0f;

    return 0;
}

int S7Light::enable(int32_t handle, int en) {

    if (handle != ID_L)
        return -EINVAL;

    unsigned long newState = en ? 1 : 0;
    int err = 0;

    if (uint32_t(newState) != mEnabled) {
        if (!mEnabled) {
            open_device();
        }
        int cmd;

/*	if (newState) {
            cmd = PS_ALS_IOCTL_ALS_ON;
            ALOGD_IF(DEBUG,"ALS ON");
        } else {
            cmd = PS_ALS_IOCTL_ALS_OFF;
            ALOGD_IF(DEBUG,"ALS OFF");
        }*/
        cmd = SENSORS_GET_LUX_FIR;
        err = ioctl(dev_fd, cmd, newState);
        err = err<0 ? -errno : 0;
        ALOGE_IF(err, "PS_ALS_IOCTL_XXX failed (%s)", strerror(-err));
        if (!err) {
            if (en) {
                setInitialState();
                mEnabled = 1;
            }
            else
                mEnabled = 0;
        }
        if (!mEnabled) {
            ALOGD_IF(DEBUG,"closing device");
            close_device();
        }
    }
    return err;
}

bool S7Light::hasPendingEvents() const {
    return mPendingMask;
}

int S7Light::readEvents(sensors_event_t* data, int count)
{
    if (count < 1)
        return -EINVAL;

    ssize_t n = mInputReader.fill(data_fd);
    if (n < 0)
        return n;

    int numEventReceived = 0;
    input_event const* event;
    while (count && mInputReader.readEvent(&event)) {
        int type = event->type;
/*        if (type == EV_ABS) {
            if (event->code == EVENT_TYPE_LIGHT) {
                ALOGD_IF(DEBUG,"Light value=%i",event->value);
                mPendingEvents.light = event->value;
            }
        } else*/ 
	if (type == EV_REL) {
           if ( event->code == REL_LIGHT) {
                mPendingEvents.light = event->value;
                 *data++ = mPendingEvents;
                 mPendingEvents.timestamp=timevalToNano(event->time);
                 count--;
                 numEventReceived++;
		ALOGE_IF(DEBUG,"S7Light new light: %d",event->value);
		int flags = 1;
		ioctl(dev_fd, SENSORS_GET_LUX_FIR,&flags);
           } else ALOGE("S7Light: unknown event (type=%d, code=%d, val: %d)",type, event->code, event->value);

	} /*else if (type == EV_SYN) {
             int64_t time = timevalToNano(event->time);
             if (mEnabled) {
                 *data++ = mPendingEvents;
                 mPendingEvents.timestamp=time;
                 count--;
                 numEventReceived++;
             }
        } */else  {
//            ALOGE("S7Light: unknown event (type=%d, code=%d)",type, event->code);
        }
//	ALOGE_IF(DEBUG,"S7Light: event (type=%d, code=%d)",type, event->code);

        mInputReader.next();
    }
    return numEventReceived;
}
