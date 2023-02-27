#ifndef RESTCLIENT_H
#define RESTCLIENT_H


#include <QObject>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QPointer>
class RestClient: public QObject
{ Q_OBJECT
public:
    RestClient(QObject * parent = nullptr);
    ~RestClient();
    void makeRequest(QStringList param, QStringList valor);
   private:
       QNetworkAccessManager * netManager;
       QNetworkReply * netReplay;
       QNetworkRequest request;
       QString headerData;

   public
       slots:

           void readReply(QNetworkReply *reply);


      signals:
           // Sinal que indica que os dados já estão prontos para serem lidos
           void dataReadyRead(QByteArray);
};

#endif // RESTCLIENT_H
