# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = manasail

CONFIG += sailfishapp

SOURCES += src/manasail.cpp

OTHER_FILES += qml/manasail.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/manasail.changes.in \
    rpm/manasail.spec \
    rpm/manasail.yaml \
    translations/*.ts \
    manasail.desktop \
    qml/pages/about.qml \
    qml/manasail.js

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/manasail-de.ts

