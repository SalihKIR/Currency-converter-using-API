import UIKit

var greeting = "Hello, playground"
var grr = "asda"


func calculateInside(str1: String, str2: String) -> String {
    for str in str1 {
        if str2.contains(str) {
            return "YES"
        }
    }
    return "NO"
}


func calculate(a: [String], b: [String]) {
    for index in 0...(a.count - 1) {
            let aStr = a[index]
            let bStr = b[index]
            
            print(calculateInside(str1: aStr, str2: bStr))
        }
}

calculate(a: ["world", "bye"], b: ["hello", "hi"])
