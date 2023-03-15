#include "controllerrequest.h"

#include <Monster.h>
#include <QCoreApplication>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>

ControllerRequest::ControllerRequest(QQmlContext * context)
{
    this->context = context;
    this->context->setContextProperty("controller", this);
    RestClient * rc = new RestClient(this);
    this->cliente = rc;
    this->context->setContextProperty("rq", this->cliente);
    connect(cliente,&RestClient::dataReadyRead,this,&ControllerRequest::setDataOnList);
}

void ControllerRequest::disparaRequest()
{
    this->continuar = true;
    if(this->ATK != ""){
        this->params.append("atk");
        this->values.append(this->ATK_opt+this->ATK);
    }
    if(this->DEF != ""){
        this->params.append("def");
        this->values.append(this->DEF_opt+this->DEF);
    }
    if(this->type != ""){
        this->params.append("type");
        this->values.append(this->type);
    }

    if(this->level != ""){
        this->params.append("level");
        this->values.append(this->level_opt+this->level);
    }
    if(this->race != ""){
        this->params.append("race");
        this->values.append(this->race);
    }
    if(this->attribute != ""){
        this->params.append("attribute");
        this->values.append(this->attribute);
    }
    if(this->lang != ""){
        this->params.append("language");
        this->values.append(this->lang);
    }
    if(this->desc != ""){
        this->params.append("desc");
        this->values.append(this->desc);
        this->params.append("fname");
        this->values.append(this->desc);
    }
    this->doSearch();

 this->cliente->makeRequest(this->params, this->values);
    return;
}

void ControllerRequest::setLang(QString l)
{
    //qDebug() << "Inside setLang Valor l: " << l;
    this->lang = l;
    return;
}

void ControllerRequest::setDesc(QString d)
{
    this->desc = d;
    return;

}

void ControllerRequest::setRace(QString r)
{
    this->race = r;
    return;
}

void ControllerRequest::setAttribute(QString a)
{
    this->attribute = a;
    return;
}

void ControllerRequest::setLevel(QString l)
{
    this->level = l;
    return;
}

void ControllerRequest::setLevelOpt(QString l)
{
this->level_opt = l;
    return;
}

void ControllerRequest::setFrameType(QString f)
{
this->type = f;
    return;
}

void ControllerRequest::setATK(QString a)
{
    this->ATK = a;
    return;
}

void ControllerRequest::setDEF(QString d)
{
    this->DEF = d;
    return;
}

void ControllerRequest::setDEFOpt(QString o)
{
    this->DEF_opt = o;
    return;
}

void ControllerRequest::setATKOpt(QString o)
{
    this->ATK_opt = o;
    return;
}

void ControllerRequest::retornar()
{
    this->continuar = false;
    this->params.clear();
    this->values.clear();
    this->m.clear();
    emit retorno();
}

void ControllerRequest::setDataOnList(QByteArray b)
{
   emit hideErrorMsg();
   QJsonDocument itemDoc = QJsonDocument::fromJson(b);
    QJsonObject rootObject = itemDoc.object();


    QJsonValue response = rootObject.value("data");
    QJsonArray responseObj = response.toArray();
    responseObj.count();
    for(QJsonValue card: responseObj){
        if(!this->continuar){
            return;
        }


        Monster * carta = new Monster();
        //qDebug() << "Carta_teste: "<< card;
        int id_mg = card.toObject().value("id").toInt();
        //qDebug() << "id_mg :" << id_mg;
        QString name =  card.toObject().value("name").toString();
        QString ulr_mg = card.toObject().value("card_images").toArray()[0].toObject().value("image_url").toString();
        QString type = card.toObject().value("type").toString();
        QString desc = card.toObject().value("desc").toString();
        QString frame = card.toObject().value("frameType").toString();
        int atk = card.toObject().value("atk").toInt();
        int def = card.toObject().value("def").toInt();
        int lvl = card.toObject().value("level").toInt();
        QString race = card.toObject().value("race").toString();
        QString atribute = card.toObject().value("attribute").toString();
        QString archetype = card.toObject().value("archetype").toString();

        //"atk":3000,"def":2500,"level":8,"race":"Dragon","attribute":"LIGHT","archetype":"Toon"



        carta->setId(id_mg);
        carta->setName(name);
        carta->setAtk(atk);
        carta->setDef(def);
        carta->setLevel(lvl);
        carta->setImg(ulr_mg);
        carta->setType(type);
        carta->setMonstertype(race);
        carta->setAttribute(atribute);
        carta->setDescription(desc);
        carta->setFrame(frame);
        carta->setArchetype(archetype);
        qDebug() << "URL IMG: " << ulr_mg;
         this->m.append(carta);
        //QStringList card_l = {id_mg, ulr_mg};
        //id, name, level,atk, def, desc, type, atribute, race, source
        emit cardAppended(carta->getId(), carta->getName(),carta->getLevel(),carta->getAtk(), carta->getDef(), carta->getDescription(), carta->getType(), carta->getAttribute(), carta->getMonstertype(),ulr_mg);
        QTime dieTime= QTime::currentTime().addMSecs(1);
            while (QTime::currentTime() < dieTime)
                QCoreApplication::processEvents(QEventLoop::AllEvents, 100);
    }


}

void ControllerRequest::resetList()
{

}
