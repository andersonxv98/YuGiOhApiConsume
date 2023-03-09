#ifndef CONTROLLERREQUEST_H
#define CONTROLLERREQUEST_H

#include "cardmodel.h"
#include "qqmlcontext.h"
#include <QObject>
#include <QPointer>
#include <RestClient.h>
class ControllerRequest: public QObject
{ Q_OBJECT
public:
    ControllerRequest(QQmlContext * context);
  Q_INVOKABLE  void disparaRequest();
  Q_INVOKABLE  void setLang(QString l);
    Q_INVOKABLE void setDesc(QString d);
    Q_INVOKABLE void retornar();
   public slots:
           void setDataOnList(QByteArray b);
           void resetList();

    signals:
           void sinal1(QString consulta,QVector<QString> param, QVector<QString> valor);
           void boleanTerminou(bool);
           void cardAppended(int, QString,int,int, int,QString, QString,QString,QString,QString);
           void doSearch();
           void retorno();
private:
       RestClient *cliente;
        QQmlContext  * context;
        QList<CardModel *>  m= {};
        QString lang;
        QString desc;
        QStringList params = {};
        QStringList values = {};
        bool continuar;// = true;
       void requestData(QStringList param, QStringList valor);
};

#endif // CONTROLLERREQUEST_H
