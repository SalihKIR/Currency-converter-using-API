import Foundation

class test {
    var plc : String
    var motherboard : String
    var boardID : Int
    
    init(plcinit: String,  motherboardinit: String, boardIDinit: Int ){
        self.plc = plcinit
        motherboard = motherboardinit
        boardID = boardIDinit
    }

    
}

func deneme(values: String) -> Int{
    var value = ""
    value = values
    guard let deneme = Int(value) else{
        print("BAŞARISIZ OLDU")
    }
}
