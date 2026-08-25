#include <QApplication>

#include "mainwindow.h"

int main(int argc, char* argv[]) {
  QApplication app(argc, argv);

  MainWindow window;
  window.show();

  return app.exec(); // this will run the event loop and returns when the app closes
}