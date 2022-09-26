#include "ApplicationManager.h"

ApplicationManager::ApplicationManager(QObject *parent) :
    QObject(parent),
    m_chat(new Chat(this))
{

}

ApplicationManager::~ApplicationManager()
{
}

Chat *ApplicationManager::chat() const
{
    return m_chat;
}
