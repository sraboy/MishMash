#include "qhexview/qhexview.h"
#include <QApplication>
#include <QFile>

int main(int argc, char *argv[]) {
	QApplication app(argc, argv);

	QHexView w;
	QFile file(argv[1]);
	file.open(QIODevice::ReadOnly);

	w.setData(&file);
	w.show();
	app.exec();
	return 0;
}
