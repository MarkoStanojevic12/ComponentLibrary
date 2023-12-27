#include "User.h"

User::User(int id, const QString &name, const QString &lastName, const QString &imageURL, QObject *parent) :
    QObject(parent),
    m_ID(id),
    m_name(name),
    m_lastName(lastName),
    m_imageURL(imageURL == "" ? "qrc:/Media/Images/avatar.jpg" : imageURL),
    m_messages(new ChatList(this)),
    m_isOnline(false)
{

}

const QString &User::name() const
{
    return m_name;
}

const QString &User::lastName() const
{
    return m_lastName;
}

const QString &User::imageURL() const
{
    return m_imageURL;
}

void User::setImageURL(const QString &newImageURL)
{
    if (m_imageURL == newImageURL)
        return;
    m_imageURL = newImageURL;
    emit imageURLChanged();
}

int User::ID() const
{
    return m_ID;
}

bool User::isOnline() const
{
    return m_isOnline;
}

void User::setIsOnline(bool newIsOnline)
{
    if (m_isOnline == newIsOnline)
        return;
    m_isOnline = newIsOnline;
    emit isOnlineChanged();
}

void User::addMessage(Message *message)
{
    m_messages->append(message);
    emit messagesChanged();
}

ChatList *User::messages() const
{
    return m_messages;
}
