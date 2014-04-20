include theos/makefiles/common.mk

BUNDLE_NAME = switchdata
switchdata_FILES = switchdata.mm
switchdata_INSTALL_PATH = /Library/PreferenceBundles
switchdata_FRAMEWORKS = UIKit
switchdata_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/switchdata.plist$(ECHO_END)
