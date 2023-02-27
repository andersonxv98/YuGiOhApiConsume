#include "maincontroll.h"
#include "ControllerRequest.h"

MainControll::MainControll(QQmlContext*  context )
{
    this->context = context;
    ControllerRequest req;
    req.disparaRequest({},{});
}
