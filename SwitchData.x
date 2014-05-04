/* Created by Mustafa Gezen on 18.04.2014 */
#include "SwitchData.h"

static void loadPreferences(void) {
    prefs = [NSMutableDictionary dictionaryWithContentsOfFile: [NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"org.mustafaa.switchdata.plist"]];
}

%hook SBApplicationIcon
    - (void)launchFromLocation:(SBIconLocation)location {
        %orig;

        loadPreferences();
        if([[prefs objectForKey:@"enabled"] boolValue]) {
            NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

            signal_strength = [[%c(SBTelephonyManager) sharedTelephonyManager] signalStrengthBars];
            wiFiEnabled = [[%c(SBWiFiManager) sharedInstance] wiFiEnabled];
            signal_min = [[prefs objectForKey:@"min_strength"] intValue];
            enable_data_if_wi = [[prefs objectForKey:@"enable_data_if_wi"] boolValue];
            key = [NSString stringWithFormat:@"SwitchData-%@", [self applicationBundleID]];

            if (signal_strength < signal_min && !wiFiEnabled) {
                [[%c(SBWiFiManager) sharedInstance] setWiFiEnabled:true];
                CTCellularDataPlanSetIsEnabled(false);
            } else if (signal_strength >= signal_min && wiFiEnabled && enable_data_if_wi && ![[prefs objectForKey:key] boolValue]) {
                [[%c(SBWiFiManager) sharedInstance] setWiFiEnabled:false];
                CTCellularDataPlanSetIsEnabled(true);
            } else if ([[prefs objectForKey:key] boolValue]) {
                [[%c(SBWiFiManager) sharedInstance] setWiFiEnabled:true];
                CTCellularDataPlanSetIsEnabled(false);
            }

            [pool drain];
        }
    }
%end