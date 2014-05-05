ARCHS = armv7 armv7s arm64
TARGET = iphone:latest:7.0
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = SwitchData
SwitchData_FILES = SwitchData.x
SwitchData_PRIVATE_FRAMEWORKS = CoreTelephony

include $(THEOS_MAKE_PATH)/tweak.mk

THEOS_PACKAGE_BASE_VERSION = 2.5
_THEOS_INTERNAL_PACKAGE_VERSION = 2.5

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += switchdata
include $(THEOS_MAKE_PATH)/aggregate.mk
