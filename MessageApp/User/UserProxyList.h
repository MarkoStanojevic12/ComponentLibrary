#ifndef USERPROXYLIST_H
#define USERPROXYLIST_H

#include <QSortFilterProxyModel>
#include "User.h"

class UserProxyList : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    UserProxyList(QObject* parent = nullptr);

    Q_INVOKABLE User* get(int index);

};

#endif // USERPROXYLIST_H
