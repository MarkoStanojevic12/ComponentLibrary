QT += quick

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        ApplicationManager.cpp \
        User/Chat.cpp \
        User/ChatList.cpp \
        User/Message.cpp \
        User/User.cpp \
        User/UserList.cpp \
        User/UserProxyList.cpp \
        core/ComponentCreatorEngine.cpp \
        core/FileWatcher.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = C:/Users/marko/Desktop/Youtube/Qt/ComponentLibrary/component_library

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    ApplicationManager.h \
    User/Chat.h \
    User/ChatList.h \
    User/Message.h \
    User/User.h \
    User/UserList.h \
    User/UserProxyList.h \
    core/ComponentCreatorEngine.h \
    core/FileWatcher.h

DISTFILES += \
    Media/Images/Elon_Musk.jpg \
    Media/Images/Leonardo_DiCaprio.png \
    Media/Images/Marko.jpg \
    Media/Images/Novak_Djokovic.jpg \
    Media/Images/Pewds.jpg \
    Media/Images/Simon_Sinek.jpg \
    Media/Images/avatar.jpg \
    Media/Images/background.png
