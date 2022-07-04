#include "ComponentCreatorEngine.h"

ComponentCreatorEngine::ComponentCreatorEngine(QObject *parent) :
    QQmlApplicationEngine(parent)
{
#ifdef QT_DEBUG
    m_fileWatcher = new FileWatcher(this);

    QObject::connect(m_fileWatcher, &FileWatcher::reloadUI, this, &ComponentCreatorEngine::reloadUI);
#endif
}

void ComponentCreatorEngine::clearCache()
{
    this->clearComponentCache();
}
