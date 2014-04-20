ARCHS = armv7 armv7s arm64
TARGET = iphone:latest:7.0
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = SwitchData
SwitchData_FILES = SwitchData.xm
SwitchData_PRIVATE_FRAMEWORKS = CoreTelephony

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += switchdata
include $(THEOS_MAKE_PATH)/aggregate.mk
