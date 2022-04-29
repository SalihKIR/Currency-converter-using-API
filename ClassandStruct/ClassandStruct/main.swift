import Foundation

var testing = test(plcinit: "Id5", motherboardinit: "anakart", boardIDinit: 55)

print(testing.plc)
testing.plc = "Dayı"
print(testing.plc)
var mytuple = ("Dayım",2)

print(mytuple.0)

var mytuple2 = ("Hata",[1,2,3,4,5])

print(mytuple2.1[3])
