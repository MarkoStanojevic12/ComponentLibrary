#ifndef CHAT_H
#define CHAT_H

#include <QObject>
#include "UserList.h"
#include "UserProxyList.h"

class Chat : public QObject
{
    Q_OBJECT
    Q_PROPERTY(User *openedChatUser READ openedChatUser WRITE setOpenedChatUser NOTIFY openedChatUserChanged)
    Q_PROPERTY(User *mainUser READ mainUser CONSTANT)
public:
    Chat(QObject* parent);

    UserList *userList() const;

    User *openedChatUser() const;
    void setOpenedChatUser(User *newOpenedChatUser);

    User *mainUser() const;

    UserProxyList *userProxyList() const;

signals:
    void openedChatUserChanged();
    void sendMessage(const QString& message);

public Q_SLOTS:
    void onSendMessage(const QString& message);

private:
    UserList* m_userList;
    UserProxyList* m_userProxyList;
    User* m_mainUser;
    User* m_openedChatUser;
};

#endif // CHAT_H
