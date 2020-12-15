import sys
import random

from PyQt5.QtGui import QPainter, QColor
from PyQt5.QtWidgets import QWidget, QApplication, QPushButton


class Example(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setGeometry(400, 400, 400, 400)
        self.setWindowTitle('Рисование')
        self.btn = QPushButton('Рисовать', self)
        self.btn.move(175, 20)
        self.do_paint = False
        self.btn.clicked.connect(self.paint)

    def paintEvent(self, event):
        if self.do_paint:
            qp = QPainter()
            qp.begin(self)
            qp.setBrush(QColor(255, 255, 0))
            self.draw_flag(qp)
            qp.end()

    def paint(self):
        n = random.randint(5, 20)
        self.N = []
        for i in range(n):
            a, b = random.randint(50, 350), random.randint(100, 350)
            self.N.append([a, b])
        self.do_paint = True
        self.repaint()

    def draw_flag(self, qp):
        for i in self.N:
            x, y = i[0], i[1]
            s = random.randint(10, 50)
            qp.drawEllipse(x - s // 2, y - s // 2, s, s)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = Example()
    ex.show()
    sys.exit(app.exec())

