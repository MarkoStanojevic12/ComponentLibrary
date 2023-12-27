#include <QGuiApplication>
#include "core/ComponentCreatorEngine.h"
#include <QQmlContext>
#include "ApplicationManager.h"

int main(int argc, char *argv[])
{
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
        QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
#endif
    }
    qputenv("MAIN_QML", "../MessageApp/main.qml");

    QGuiApplication app(argc, argv);

    ComponentCreatorEngine engine;
    engine.addImportPath("../component_library");

    ApplicationManager* appManager = new ApplicationManager(&engine);

    engine.rootContext()->setContextProperty("QmlEngine", &engine);
    engine.rootContext()->setContextProperty("Chat", appManager->chat());
    engine.rootContext()->setContextProperty("Users", appManager->chat()->userProxyList());

    qRegisterMetaType<Message*>("Message*");

    const QUrl url(qgetenv("MAIN_QML"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
