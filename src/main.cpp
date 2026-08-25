#include <QApplication>
#include <QStyleFactory>
#include <QFile>
#include <QIODevice>

#include "mainwindow.h"

int main(int argc, char* argv[]) {
  QApplication app(argc, argv);

  // ---- Window UI theme using style.qss (I fabricated this with Claude Design) ----
  app.setStyle(QStyleFactory::create("Fusion"));
  {
    QFile f(":/style.qss");
    if (f.open(QIODevice::ReadOnly | QIODevice::Text))
      app.setStyleSheet(QString::fromUtf8(f.readAll()));
      f.close();
  }
  

  MainWindow window;
  window.show();

  return app.exec(); // this will run the event loop and returns when the app closes
}