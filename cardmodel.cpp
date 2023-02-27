#include "cardmodel.h"

CardModel::CardModel()
{

}

QString CardModel::getId()
{
    return id;
}

void CardModel::setId(QString newId)
{
    id = newId;
}

QString CardModel::getName()
{
    return name;
}

void CardModel::setName( QString newName)
{
    name = newName;
    emit nameChanged(name);
}

QString CardModel::getType()
{
    return type;
}

void CardModel::setType( QString newType)
{
    type = newType;
}

QString CardModel::getAtk()
{
    return atk;
}

void CardModel::setAtk( QString newAtk)
{
    atk = newAtk;
    emit atkChanged(atk);
}

QString CardModel::getDef()
{
    return def;
}

void CardModel::setDef( QString newDef)
{
    def = newDef;
    emit defChanged(def);
}

QString CardModel::img()
{
    return img_;

}

void CardModel::setImg( QString newImg)
{
    img_ = newImg;
    emit imgChanged(img_);
}
