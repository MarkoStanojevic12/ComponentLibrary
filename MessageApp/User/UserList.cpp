#include "UserList.h"

UserList::UserList(QObject *parent) :
    QObject(parent)
{
    m_users.append(new User(1, "Marko", "Stanojevic", "", this));
    m_users.append(new User(2, "Novak", "Djokovic", "https://pbs.twimg.com/profile_images/1219965365226065920/EBF8Rd9v_400x400.jpg", this));
    m_users.append(new User(3, "Elon", "Musk", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/1200px-Elon_Musk_Royal_Society_%28crop2%29.jpg", this));
    m_users.append(new User(4, "Felix", "Kjellberg", "https://staticg.sportskeeda.com/editor/2021/08/b701f-16294304565102-800.jpg", this));
    m_users.append(new User(5, "Mom", "", "", this));
    m_users.append(new User(6, "Leonardo", "DiCaprio", "https://assets.weforum.org/sf_account/image/GpsMwgoVb5muWo9s5p8Z4XjTRfGnvtUtmQTqJ7dYEJA.jpg", this));
    m_users.append(new User(7, "Alexis", "Ren",  "https://media.glamour.com/photos/6165d7aa4beb8802a4c2d7ea/master/pass/unnamed%20(6).jpeg", this));
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
