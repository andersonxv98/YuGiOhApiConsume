QT += quick\
      network\
      widgets

SOURCES += \
        cardmodel.cpp \
        controllerrequest.cpp \
        main.cpp \
        restclient.cpp

resources.files = main.qml 
resources.prefix = /$${TARGET}
RESOURCES += resources\
            CardView.qml\
            filterView.qml\
            headerView.qml\
            footerView.qml

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    cardmodel.h \
    controllerrequest.h \
    restclient.h

android: include(android_openssl-master/openssl.pri)

DISTFILES += \
    CardView.qml \
    filterView.qml \
    footerView.qml \
    headerView.qml
