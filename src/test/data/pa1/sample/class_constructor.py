class Foo(object):
    x:int = 0

    def __init__(self:"Foo", x:int) -> object:
        self.x = x

f = Foo(1)
print(f.x)
