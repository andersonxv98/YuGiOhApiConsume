#ifndef SPELLTRAP_H
#define SPELLTRAP_H


#include "cardmodel.h"
class SpellTrap : public CardModel
{ Q_OBJECT
public:
    SpellTrap();
    QString getSTtype();
    void setSTtype(QString newSTtype);

private:
    QString STtype; // RAce
};

#endif // SPELLTRAP_H
