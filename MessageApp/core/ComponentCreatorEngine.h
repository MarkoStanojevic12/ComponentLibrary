#ifndef COMPONENTCREATORENGINE_H
#define COMPONENTCREATORENGINE_H

#include <QQmlApplicationEngine>
#include "FileWatcher.h"

class ComponentCreatorEngine : public QQmlApplicationEngine
{
    Q_OBJECT
public:
    ComponentCreatorEngine(QObject *parent = Q_NULLPTR);

    Q_INVOKABLE void clearCache();

private:
    FileWatcher* m_fileWatcher;

Q_SIGNALS:
    void reloadUI();
};

#endif // COMPONENTCREATORENGINE_H
