

class Point:
    x = 0
    y = 0

    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def __str__(self):
        return "P(%r, %r)" % (self.x, self.y)
    __repr__ = __str__
