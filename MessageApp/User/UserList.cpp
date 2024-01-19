#include "UserList.h"

UserList::UserList(QObject *parent) :
    QAbstractListModel(parent)
{
    m_users.append(new User(1, "Marko", "Stanojevic", "", this));
    m_users.append(new User(2, "Novak", "Djokovic", "https://pbs.twimg.com/profile_images/1219965365226065920/EBF8Rd9v_400x400.jpg", this));
    m_users.append(new User(3, "Elon", "Musk", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/1200px-Elon_Musk_Royal_Society_%28crop2%29.jpg", this));
    m_users.append(new User(4, "Felix", "Kjellberg", "https://staticg.sportskeeda.com/editor/2021/08/b701f-16294304565102-800.jpg", this));
    m_users.append(new User(5, "Mom", "", "", this));
    m_users.append(new User(6, "Alexis", "Ren",  "https://media.glamour.com/photos/6165d7aa4beb8802a4c2d7ea/master/pass/unnamed%20(6).jpeg", this));
}

const QList<User *> &UserList::users() const
{
    return m_users;
}

void UserList::setUsers(const QList<User *> &newUsers)
{
    if (m_users == newUsers)
        return;
    m_users = newUsers;
    emit usersChanged();
}

int UserList::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)

    return m_users.count();
}

QVariant UserList::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_users.count())
        return QVariant();

    if (role == IDRole)
        return m_users[index.row()]->ID();
    else if (role == NameRole)
        return m_users[index.row()]->name();
    else if (role == LastNameRole)
        return m_users[index.row()]->lastName();
    else if (role == ImageURLRole)
        return m_users[index.row()]->imageURL();
    else if (role == MessagesRole)
        return QVariant::fromValue(m_users[index.row()]->messages());
    else if (role == IsOnlineRole)
        return m_users[index.row()]->isOnline();
    else if (role == UserObjectRole)
        return QVariant::fromValue(m_users[index.row()]);
    else
        return QVariant();
}

bool UserList::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (index.row() < 0 || index.row() >= m_users.count())
        return false;

    if (role == IsOnlineRole)
        m_users[index.row()]->setIsOnline(value.toBool());
    else
        return false;
}

QHash<int, QByteArray> UserList::roleNames() const
{
    QHash<int, QByteArray> roles;

    roles[IDRole] = "ID";
    roles[NameRole] = "name";
    roles[LastNameRole] = "lastName";
    roles[ImageURLRole] = "imageURL";
    roles[MessagesRole] = "messages";
    roles[IsOnlineRole] = "isOnline";
    roles[UserObjectRole] = "userObject";

    return roles;
}
