#include "ChatList.h"

ChatList::ChatList(QObject *parent)
    : QAbstractListModel(parent)
{

}

int ChatList::count() const
{
    return m_messages.count();
}

int ChatList::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_messages.count();
}

QVariant ChatList::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    Message* message = m_messages.at(index.row());

    if (role == UserIDRole)
        return message->userID();
    else if (role == TimeRole)
        return message->time();
    else if (role == ContentsRole)
        return message->contents();
    else
        return QVariant();

}

QHash<int, QByteArray> ChatList::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[UserIDRole] = "userID";
    roles[TimeRole] = "time";
    roles[ContentsRole] = "contents";

    return roles;
}

void ChatList::append(Message *message)
{
    beginInsertRows(QModelIndex(), m_messages.count(), m_messages.count());
    m_messages.append(message);
    endInsertRows();

    emit countChanged();
}

Message *ChatList::at(int index) const
{
    if (index < 0 || index >= m_messages.count())
        return nullptr;

    return m_messages.at(index);
}
