#ifndef MONSTER_H
#define MONSTER_H


#include "cardmodel.h"
class Monster : public CardModel
{ Q_OBJECT
public:
    Monster();
    QString getAttribute();
    void setAttribute( QString newAttribute);

    int getAtk();
    void setAtk(int newAtk);

    int getDef();
    void setDef(int newDef);

    int getLevel();
    void setLevel(int &newLevel);

    QString getMonstertype();
    void setMonstertype( QString newMonstertype);

private:
    QString attribute;
    int atk;
    int def;
    int level;
    QString monstertype; //Race like : Warrior, Spellcaster;


};

#endif // MONSTER_H
