#ifndef USERLIST_H
#define USERLIST_H

#include <QObject>
#include "User.h"

class UserList : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<User *> users READ users WRITE setUsers NOTIFY usersChanged)
public:
    UserList(QObject* parent);

    const QList<User *> &users() const;
    void setUsers(const QList<User *> &newUsers);

signals:
    void usersChanged();

private:
    QList<User*> m_users;
};

#endif // USERLIST_H
