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
    Q_INVOKABLE void setRace(QString r);
    Q_INVOKABLE void setAttribute(QString a);
    Q_INVOKABLE void setLevel(QString l);
    Q_INVOKABLE void setLevelOpt(QString l);
    Q_INVOKABLE void setFrameType(QString f);
    Q_INVOKABLE void setATK(QString a);
    Q_INVOKABLE void setDEF(QString d);
    Q_INVOKABLE void setDEFOpt(QString o);
    Q_INVOKABLE void setATKOpt(QString o);
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
           void hideErrorMsg();
private:
       RestClient *cliente;
        QQmlContext  * context;
        QList<CardModel *>  m= {};
        QString lang;
        QString desc;
        QString race;
        QString level;
        QString level_opt = "";
        QString attribute;
        QString type;
        QString ATK;
        QString DEF;
        QString ATK_opt;
        QString DEF_opt;
        QStringList params = {};
        QStringList values = {};
        bool continuar;// = true;
       void requestData(QStringList param, QStringList valor);
};

#endif // CONTROLLERREQUEST_H
