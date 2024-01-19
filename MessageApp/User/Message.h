#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>

class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString contents READ contents CONSTANT)
    Q_PROPERTY(QString time READ time CONSTANT)
    Q_PROPERTY(int userID READ userID CONSTANT)
public:
    Message(const QString& contents, int userID, QObject* parent);

    const QString &contents() const;
    const QString &time() const;
    int userID() const;

private:
    QString m_contents;
    QString m_time;
    int m_userID;
};

Q_DECLARE_METATYPE(Message*)

#endif // MESSAGE_H
