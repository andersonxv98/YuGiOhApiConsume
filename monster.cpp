#include "monster.h"

Monster::Monster()
{

}

QString Monster::getAttribute()
{
    return attribute;
}

void Monster::setAttribute(QString newAttribute)
{
    attribute = newAttribute;
}

int Monster::getAtk()
{
    return atk;
}

void Monster::setAtk(int newAtk)
{
    atk = newAtk;
}

int Monster::getDef()
{
    return def;
}

void Monster::setDef(int newDef)
{
    def = newDef;
}

int Monster::getLevel()
{
    return level;
}

void Monster::setLevel(int &newLevel)
{
    level = newLevel;
}

QString Monster::getMonstertype()
{
    return monstertype;
}

void Monster::setMonstertype(QString newMonstertype)
{
    monstertype = newMonstertype;
}
