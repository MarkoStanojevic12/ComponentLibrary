#ifndef CHATLIST_H
#define CHATLIST_H

#include "User/Message.h"
#include <QAbstractListModel>

class ChatList : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged FINAL)
public:
    enum ChatRoles {
        UserIDRole = Qt::UserRole + 1,
        TimeRole,
        ContentsRole
    };

    ChatList(QObject* parent);

    int count() const;
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    void append(Message* message);
    Q_INVOKABLE Message* at(int index) const;

signals:
    void countChanged();
private:
    QList<Message*> m_messages;
};

#endif // CHATLIST_H
