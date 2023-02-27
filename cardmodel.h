#ifndef CARDMODEL_H
#define CARDMODEL_H


#include "qobject.h"
class CardModel : public QObject
{Q_OBJECT
public:
    CardModel();

    QString getId() ;
    void setId( QString newId);

    QString getName() ;
    void setName( QString newName);

    QString getType() ;
    void setType( QString newType);

    QString getAtk() ;
    void setAtk( QString newAtk);

    QString getDef() ;
    void setDef( QString newDef);

    QString img() ;
    void setImg( QString newImg);
signals:
    void nameChanged(QString q);
    void imgChanged(QString q);
    void atkChanged(QString q);
    void defChanged(QString q);

private:
    QString id;
    QString name;
    QString type;
    QString atk;
    QString def;
    QString img_;
};

#endif // CARDMODEL_H
