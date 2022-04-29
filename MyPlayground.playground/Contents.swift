import UIKit


let testWord = "abc"
let testWord2 = "aaa"

func isAnagram(word: String, isAnagramOf: String) -> Int {
    if word.count != isAnagramOf.count {
        return -1
    }
    guard
        let word1Dictionary = countChars(word: word),
        let word2Dictionary = countChars(word: isAnagramOf) else {
            return 0
    }
    //print("--", word1Dictionary)
    //print("++", word2Dictionary)
    var aradakiEksik = 0
    for (k, v) in word1Dictionary {
        let fark = v - (word2Dictionary[k] ?? 0)
        aradakiEksik = aradakiEksik + fark
            //print(k, fark, aradakiEksik)
            
    }
    return aradakiEksik
}

func countChars(word: String?) -> [Character: Int]? {
    guard let word = word, word != "" else {
        return nil
    }
    var dictionary = [Character: Int]()
    
    for char in word {
        if let currentValue = dictionary[char] {
            dictionary.updateValue(currentValue + 1, forKey: char)
        } else {
            dictionary[char] = 1
        }
    }
    return dictionary
}

var dct: [Character: Int] = [:]
 
let aArr = ["abc", "aaa"]
let bArr = ["bbb", "bba"]

for idx in 0...(aArr.count - 1) {
    print(isAnagram(word: aArr[idx], isAnagramOf: bArr[idx]))
}

