#include "Message.h"
#include <QTime>
Message::Message(const QString &contents, int userID, QObject *parent) :
    QObject(parent),
    m_contents(contents),
    m_time(QTime::currentTime().toString("HH:mm")),
    m_userID(userID)
{

}

const QString &Message::contents() const
{
    return m_contents;
}

const QString &Message::time() const
{
    return m_time;
}

int Message::userID() const
{
    return m_userID;
}
