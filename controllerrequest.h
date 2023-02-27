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
    void disparaRequest(QStringList param, QStringList valor);
   public slots:
           void setDataOnList(QByteArray b);
           void resetList();
    signals:
           void sinal1(QString consulta,QVector<QString> param, QVector<QString> valor);
           void boleanTerminou(bool);
           void imgAppended(QString);
private:
       RestClient *cliente;
        QQmlContext  * context;
        QList<CardModel *>  m= {};
       void requestData(QStringList param, QStringList valor);
};

#endif // CONTROLLERREQUEST_H
