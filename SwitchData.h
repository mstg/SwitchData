/* Created by Mustafa Gezen on 18.04.2014 */
#include <CoreTelephony/CTCellularDataPlan.h>

static int signal_strength;
static int signal_min;
static bool wiFiEnabled;
static bool enable_data_if_wi;
static void loadPreferences();
static NSString *identifier;
static NSString *key;
static NSMutableDictionary *prefs = nil;

@interface SBWiFiManager
    + (id)sharedInstance;
    - (BOOL)wiFiEnabled;
    - (void)setWiFiEnabled:(BOOL)enabled;
    - (int)signalStrengthBars;
@end

typedef enum {
    SBIconLocationHomeScreen = 0,
    SBIconLocationDock       = 1,
    SBIconLocationSwitcher   = 2
} SBIconLocation;

@interface SBApplicationIcon
    - (void)launchFromLocation:(SBIconLocation)location;
@end

@interface SBTelephonyManager
    + (id)sharedTelephonyManager;
    - (int)signalStrengthBars;
@end
