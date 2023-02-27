#ifndef MAINCONTROLL_H
#define MAINCONTROLL_H

#include <QQmlContext>




class MainControll
{
public:
    MainControll(QQmlContext * context = nullptr);
private:
    QQmlContext  * context;
};

#endif // MAINCONTROLL_H
