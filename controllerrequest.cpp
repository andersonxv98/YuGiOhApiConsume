#include "controllerrequest.h"

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>

ControllerRequest::ControllerRequest(QQmlContext * context)
{
    this->context = context;
    this->context->setContextProperty("carta", this);
    RestClient * rc = new RestClient(this);
    this->cliente = rc;
    connect(cliente,&RestClient::dataReadyRead,this,&ControllerRequest::setDataOnList);
}

void ControllerRequest::disparaRequest(QStringList param, QStringList valor)
{
 this->cliente->makeRequest(param, valor);
    return;
}

void ControllerRequest::setDataOnList(QByteArray b)
{
    qDebug() << "inside setDataONLIst" ;
    //qDebug() << b;
   QJsonDocument itemDoc = QJsonDocument::fromJson(b);
    QJsonObject rootObject = itemDoc.object();


    QJsonValue response = rootObject.value("data");
    //SSSSSSqDebug() << response;
    QJsonArray responseObj = response.toArray();
    for(QJsonValue card: responseObj){
        //card.toObject().keys();
        CardModel * carta = new CardModel();
        QString ulr_mg = card.toObject().value("card_images").toArray()[0].toObject().value("image_url").toString();
        carta->setImg(ulr_mg);
        qDebug() << "URL IMG: " << ulr_mg;
         this->m.append(carta);
        emit imgAppended(ulr_mg);
    }
    // print out the list of keys ("count")
    /*QStringList keys = responseObj[0].toObject().keys();
    QString ulr_img  = responseObj[0].toObject().value("card_images").toArray()[0].toObject().value("image_url").toString();
    foreach(QString key, keys)
    {
        qDebug() << key;
    }*/
    //this->m->setImg(ulr_img);
}

void ControllerRequest::resetList()
{

}
