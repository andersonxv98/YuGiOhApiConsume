#ifndef CARDMODEL_H
#define CARDMODEL_H


#include "qobject.h"
class CardModel : public QObject
{Q_OBJECT
public:
    CardModel();

    int getId() ;
    void setId(int newId);

    QString getName() ;
    void setName( QString newName);

    QString getType() ;
    void setType( QString newType);

    QString img() ;
    void setImg( QString newImg);
    QString getFrame();
    void setFrame(QString newFrame);

    QString getDescription();
    void setDescription(QString newDescription);

    QString getArchetype();
    void setArchetype( QString newArchetype);

signals:
    void nameChanged(QString q);
    void imgChanged(QString q);
    void atkChanged(QString q);
    void defChanged(QString q);

private:
    int id;
    QString name;
    QString type;
    QString img_;
    QString frame;
    QString description;
    QString archetype;
};

#endif // CARDMODEL_H
