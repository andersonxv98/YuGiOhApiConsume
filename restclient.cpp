#include "restclient.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QNetworkReply>
#include <QNetworkReply>

RestClient::RestClient(QObject *parent) : QObject(parent)
{
    netManager = new QNetworkAccessManager(this);
        netReplay = nullptr;

        // estabelece a conexão entre o sinal de finalização e nosso slot que realiza a leitura do retorno
        connect(netManager,&QNetworkAccessManager::finished,this,&RestClient::readReply);

}

RestClient::~RestClient()
{



    //netManager->deleteLater();
    //headerData.clear();
}




void RestClient::makeRequest(QStringList param, QStringList valor)
{
    qDebug() << "Inside makeRequest";
    QString urlIni = "https://db.ygoprodeck.com/api/v7/cardinfo.php?";

   QString parametros = "";
    for(int i = 0; i < param.length(); i++)
    {
        parametros += param[i]+"="+valor[i]+"&";
    }
    qDebug() << "Parametros : "  << parametros;
    QNetworkRequest request;
    request.setUrl(QUrl(urlIni+parametros));

    //qDebug() << request.url().toString();
    //this->netReplay =netManager->get(request);

   netManager->get(request);


    //readReply(this->netReplay);
 return;
}

void RestClient::readReply(QNetworkReply *reply)
{
    qDebug() << "entrou reay reply";
    //Cria um array de bytes para armazenar as informações
    QByteArray myData;
    //Lê todos os retornos do reply e armazena no array de bytes
    myData = reply->readAll();
    qDebug() << myData;

    QJsonDocument itemDoc = QJsonDocument::fromJson(myData);
    QJsonObject rootObject = itemDoc.object();


         QString response = rootObject.value("error").toString();
         qDebug() << "RESPONSE: " <<response;
        if(!response.contains("No card matching your query was found in the database")){
          //qDebug()<< "VEIO COISA";
           emit dataReadyRead(myData);
        }
        else{
           emit error();
        }



    //qDebug() << reply->isFinished();
    //qDebug() << reply->error();

    //emite um sinal indicando que os dados já foram lidos e estão prontos para serem usados


    return;
}
