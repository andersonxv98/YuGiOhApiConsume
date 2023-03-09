#include "cardmodel.h"

CardModel::CardModel()
{

}

int CardModel::getId()
{
    return id;
}

void CardModel::setId(int newId)
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


QString CardModel::img()
{
    return img_;

}

void CardModel::setImg( QString newImg)
{
    img_ = newImg;
    emit imgChanged(img_);
}

QString CardModel::getFrame()
{
    return frame;
}

void CardModel::setFrame(QString newFrame)
{
    frame = newFrame;
}

QString CardModel::getDescription()
{
    return description;
}

void CardModel::setDescription(QString newDescription)
{
    description = newDescription;
}

QString CardModel::getArchetype()
{
    return archetype;
}

void CardModel::setArchetype(QString newArchetype)
{
    archetype = newArchetype;
}
