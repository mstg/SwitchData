#import <Preferences/Preferences.h>

@interface switchdataListController: PSListController {
}
@end

@implementation switchdataListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"switchdata" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
