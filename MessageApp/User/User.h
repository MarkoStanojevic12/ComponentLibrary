#ifndef USER_H
#define USER_H

#include <QObject>
#include "Message.h"
#include "User/ChatList.h"

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int ID READ ID CONSTANT)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString lastName READ lastName CONSTANT)
    Q_PROPERTY(QString imageURL READ imageURL WRITE setImageURL NOTIFY imageURLChanged)
    Q_PROPERTY(bool isOnline READ isOnline WRITE setIsOnline NOTIFY isOnlineChanged)
    Q_PROPERTY(ChatList *messages READ messages CONSTANT FINAL)

public:
    User(int id, const QString& name, const QString& lastName, const QString& imageURL, QObject* parent);

    const QString &name() const;
    const QString &lastName() const;
    const QString &imageURL() const;
    void setImageURL(const QString &newImageURL);

    int ID() const;

    bool isOnline() const;
    void setIsOnline(bool newIsOnline);

    void addMessage(Message* message);

    ChatList *messages() const;
    void setMessages(ChatList *newMessages);

signals:
    void imageURLChanged();
    void isOnlineChanged();
    void messagesChanged();

private:
    int m_ID;
    QString m_name;
    QString m_lastName;
    QString m_imageURL;
    ChatList* m_messages;

    bool m_isOnline;
};

#endif // USER_H
