#include "UserProxyList.h"
#include "UserList.h"

UserProxyList::UserProxyList(QObject *parent)
    : QSortFilterProxyModel(parent)
{
    setFilterRole(UserList::UserRoles::NameRole);
    setFilterCaseSensitivity(Qt::CaseInsensitive);
    setSortRole(UserList::UserRoles::NameRole);

    sort(0, Qt::AscendingOrder);
}

User *UserProxyList::get(int index)
{
    if (index < 0 || index >= rowCount())
        return nullptr;

    QModelIndex modelIndex = this->index(index, 0);
    QModelIndex sourceIndex = mapToSource(modelIndex);
    return sourceModel()->data(sourceIndex, UserList::UserRoles::UserObjectRole).value<User*>();
}
