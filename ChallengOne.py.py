def cir():
    a=float(input("Enter The Radius Of Circe:"))
    b=3.14159*a*a
    print("Area Of Circle:",b)

def square():
    s=float(input("Enter The Side Length Of Square:"))
    print("Area Of Square:",s*s)

def rect():
    p=float(input("Enter The Length Of Rectangle:"))
    q=float(input("Enter The Width Of Rectangle:"))
    print("Area Of Rectangle:",p*q)

def triangle():
    s=float(input("Enter The Base:"))
    t=float(input("Enter The Height:"))
    area=0.5*s*t
    print("Area Of The Triangle:",area)
