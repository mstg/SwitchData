#include <CoreTelephony/CTCellularDataPlan.h>

static int signal_strength;
static int signal_min;
static bool wiFiEnabled;
static void loadPreferences();
NSMutableDictionary *prefs = nil;

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
    - (NSString *)displayName;
@end

@interface SBTelephonyManager
    + (id)sharedTelephonyManager;
    - (int)signalStrengthBars;
@end

static void loadPreferences(void) {
    prefs = [NSMutableDictionary dictionaryWithContentsOfFile: [NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"org.mustafaa.switchdata_preferences.plist"]];
}
