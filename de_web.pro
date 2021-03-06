TARGET   = de_rest_plugin

# common configuration for deCONZ plugins

TARGET = $$qtLibraryTarget($$TARGET)

DEFINES += DECONZ_DLLSPEC=Q_DECL_IMPORT

unix:contains(QMAKE_HOST.arch, armv6l) {
    DEFINES += ARCH_ARM ARCH_ARMV6
}
unix:contains(QMAKE_HOST.arch, armv7l) {
    DEFINES += ARCH_ARM ARCH_ARMV7
}

unix:contains(QMAKE_HOST.arch, armv7l) {
    DEFINES += ARCH_ARM ARCH_ARMV7
}

QMAKE_CXXFLAGS += -Wno-attributes \
                  -Wall

CONFIG(debug, debug|release) {
    LIBS += -L../../debug
}

CONFIG(release, debug|release) {
    LIBS += -L../../release
}

greaterThan(QT_MAJOR_VERSION, 4) {
    QT += core gui widgets serialport
}

win32:LIBS +=  -L../.. -ldeCONZ1
unix:LIBS +=  -L../.. -ldeCONZ
win32:CONFIG += dll

unix:!macx {
    LIBS += -lcrypt
}

TEMPLATE        = lib
CONFIG         += plugin \
               += debug_and_release

QT             += network

INCLUDEPATH    += ../.. \
                  ../../common
                  
unix:INCLUDEPATH += /usr/include

# Version Major.Minor.Build
# Important: don't change the format of this line since it's parsed by scripts!
DEFINES += GW_SW_VERSION=\\\"2.04.18\\\"

# Minimum version of the RaspBee firmware
# which shall be used in order to support all features for this software release (case sensitive)
DEFINES += GW_MIN_RPI_FW_VERSION=0x260b0500

# Minimum version of the deRFusb23E0X firmware
# which shall be used in order to support all features for this software release
DEFINES += GW_MIN_DERFUSB23E0X_FW_VERSION=0x22030300

unix:contains(QMAKE_HOST.arch, armv6l) {
    DEFINES += GW_DEFAULT_NAME=\\\"RaspBee-GW\\\"
}
else {
    DEFINES += GW_DEFAULT_NAME=\\\"deCONZ-GW\\\"
}

QMAKE_CXXFLAGS += -Wno-attributes

HEADERS  = bindings.h \
           connectivity.h \
           colorspace.h \
           de_web_plugin.h \
           de_web_plugin_private.h \
           de_web_widget.h \
           gateway.h \
           gateway_scanner.h \
           group.h \
           group_info.h \
           json.h \
           light_node.h \
           sqlite3.h \
           rest_node_base.h \
           rule.h \
           scene.h \
           sensor.h

SOURCES  = authentification.cpp \
           atmel_wsndemo_sensor.cpp \
           bindings.cpp \
           change_channel.cpp \
           connectivity.cpp \
           colorspace.cpp \
           database.cpp \
           discovery.cpp \
           de_web_plugin.cpp \
           de_web_widget.cpp \
           de_otau.cpp \
           firmware_update.cpp \
           gateway.cpp \
           gateway_scanner.cpp \
           group.cpp \
           group_info.cpp \
           gw_uuid.cpp \
           json.cpp \
           light_node.cpp \
           sqlite3.c \
           rest_configuration.cpp \
           rest_gateways.cpp \
           rest_groups.cpp \
           rest_lights.cpp \
           rest_node_base.cpp \
           rest_rules.cpp \
           rest_sensors.cpp \
           rest_schedules.cpp \
           rest_touchlink.cpp \
           rule.cpp \
           upnp.cpp \
           permitJoin.cpp \
           scene.cpp \
           sensor.cpp \
           reset_device.cpp \
           rest_userparameter.cpp \
           zcl_tasks.cpp

win32:DESTDIR  = ../../debug/plugins # TODO adjust
unix:DESTDIR  = ..

FORMS += \
    de_web_widget.ui
