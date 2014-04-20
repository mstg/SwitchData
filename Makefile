THEOS_DEVICE_IP = 10.0.0.6

ARCHS = armv7
TARGET = iphone:latest:6.1
include theos/makefiles/common.mk

TWEAK_NAME = SwitchData
SwitchData_FILES = SwitchData.xm
SwitchData_PRIVATE_FRAMEWORKS = CoreTelephony

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += switchdata
include $(THEOS_MAKE_PATH)/aggregate.mk
