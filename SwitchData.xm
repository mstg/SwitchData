/* Created by Mustafa Gezen on 18.04.2014 */
#include "SwitchData.h"

%hook SBApplicationIcon
    -(void)launchFromLocation:(SBIconLocation)location
    {
        loadPreferences();
        if([[prefs objectForKey:@"enabled"] boolValue]) {
            NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

            signal_strength = [[%c(SBTelephonyManager) sharedTelephonyManager] signalStrengthBars];
            wiFiEnabled = [[%c(SBWiFiManager) sharedInstance] wiFiEnabled];
            signal_min = [[prefs objectForKey:@"min_strength"] intValue];

            if (signal_strength < signal_min && !wiFiEnabled) {
                [[%c(SBWiFiManager) sharedInstance] setWiFiEnabled:true];
                CTCellularDataPlanSetIsEnabled(false);
            } else if (signal_strength >= signal_min && wiFiEnabled) {
                [[%c(SBWiFiManager) sharedInstance] setWiFiEnabled:false];
                CTCellularDataPlanSetIsEnabled(true);
            }

            [pool drain];
        }
        %orig;
    }
%end
