ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:12.2
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_DEVICE_IP = localhost -p 2222
DEBUG=0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MinusX

MinusX_FILES = $(shell find Sources/MinusX -name '*.swift') $(shell find Sources/MinusXC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
MinusX_SWIFTFLAGS = -ISources/MinusXC/include
MinusX_CFLAGS = -fobjc-arc -ISources/MinusXC/include

include $(THEOS_MAKE_PATH)/tweak.mk
