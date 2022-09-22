#include "Chat.h"
#include "Message.h"

Chat::Chat(QObject *parent) :
    QObject(parent),
    m_userList(new UserList(this)),
    m_mainUser(new User(0, "Sam", "Samsun", "", this)),
    m_openedChatUser(Q_NULLPTR)
{
    connect(this, &Chat::sendMessage, this, &Chat::onSendMessage, Qt::QueuedConnection);
}

UserList *Chat::userList() const
{
    return m_userList;
}

User *Chat::openedChatUser() const
{
    return m_openedChatUser;
}

void Chat::setOpenedChatUser(User *newOpenedChatUser)
{
    if (m_openedChatUser == newOpenedChatUser)
        return;
    m_openedChatUser = newOpenedChatUser;
    emit openedChatUserChanged();
}

User *Chat::mainUser() const
{
    return m_mainUser;
}

void Chat::onSendMessage(const QString &message)
{
    if(m_openedChatUser == Q_NULLPTR)
        return;
    m_openedChatUser->addMessage(new Message(message, m_mainUser->ID(), m_openedChatUser));
}
