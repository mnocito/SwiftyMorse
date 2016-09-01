//
//  SwiftyMorse.swift
//  SwiftyMorse
//
//  Created by Marco on 9/1/16.
//  Copyright © 2016 Marco. All rights reserved.
//

import Foundation
private let abcToMorse = [
    "A": ".-",
    "B": "-...",
    "C": "-.-.",
    "D": "-..",
    "E": ".",
    "F": "..-.",
    "G": "--.",
    "H": "....",
    "I": "..",
    "J": ".---",
    "K": "-.-",
    "L": ".-..",
    "M": "--",
    "N": "-.",
    "O": "---",
    "P": ".--.",
    "Q": "--.-",
    "R": ".-.",
    "S": "...",
    "T": "-",
    "U": "..-",
    "V": "...-",
    "W": ".--",
    "X": "-..-",
    "Y": "-.--",
    "Z": "--..",
    "0": "-----",
    "1": ".----",
    "2": "..---",
    "3": "...--",
    "4": "....-",
    "5": ".....",
    "6": "-....",
    "7": "--...",
    "8": "---..",
    "9": "----.",
    " ": "/"
]
private let morseToAbc = [
    ".-": "A",
    "-...": "B",
    "-.-.": "C",
    "-..": "D",
    ".": "E",
    "..-.": "F",
    "--.": "G",
    "....": "H",
    "..": "I",
    ".---": "J",
    "-.-": "K",
    ".-..": "L",
    "--": "M",
    "-.": "N",
    "---": "O",
    ".--.": "P",
    "--.-": "Q",
    ".-.": "R",
    "...": "S",
    "-": "T",
    "..-": "U",
    "...-": "V",
    ".--": "W",
    "-..-": "X",
    "-.--": "Y",
    "--..": "Z",
    "-----": "0",
    ".----": "1",
    "..---": "2",
    "...--": "3",
    "....-": "4",
    ".....": "5",
    "-....": "6",
    "--...": "7",
    "---..": "8",
    "----.": "9",
    "/": " "
]
public func strip(lang: String, text: String) -> String {
    switch(lang) {
    case "Morse":
        var newCharArray = [Character]()
        if validMorseChars(text.componentsSeparatedByString(" ")) {
            return text
        } else {
            let charArray = Array(text.characters)
            for (i, char) in charArray.enumerate() {
                if validSingleMorseChar(char) {
                    if char == " " {
                        if validSingleMorseChar(charArray[i-1]) && charArray[i-1] != " " {
                            // removes spaces between words from invalid characters
                            print(i)
                            newCharArray.append(char)
                        }
                    } else {
                        newCharArray.append(char)
                    }
                }
            }
            return String(newCharArray)
        }
    case "English":
        var newCharArray = [Character]()
        var engChars = Array(text.uppercaseString.characters)
        if validEngChars(engChars) {
            return text
        } else {
            for (i, char) in engChars.enumerate() {
                if validSingleEngChar(char) {
                    if char == " " {
                        if engChars[i+1] != "/" && engChars[i-1] != "/" {
                            newCharArray.append(char)
                        }
                    }
                }
            }
            return String(newCharArray)
        }
    default:
        return "Error: Language \(lang) is not a supported language. Did you misspell something?"
    }
}
public func translateTo(lang: String, text: String) -> String {
    switch(lang) {
    case "Morse":
        return translateMorse(Array(text.uppercaseString.characters))
    case "English":
        let morseChars = text.componentsSeparatedByString(" ")
        return translateEng(morseChars)
    default:
        return "Error: Language \(lang) is not a supported language. Did you misspell something?"
    }
}
// returns empty string if not valid
private func translateEng(morseChars: [String]) -> String {
    var retString: String = ""
    if validMorseChars(morseChars) {
        for key in morseChars {
            retString += morseToAbc[key]!
        }
    }
    return retString
}
// returns empty string if not valid
private func translateMorse(engChars: [Character]) -> String {
    var retString: String = ""
    if validEngChars(engChars) {
        for (i, key) in engChars.enumerate() {
            retString += abcToMorse[String(key)]!
            if i != engChars.count - 1 {
                retString += " "
            }
        }
    }
    return retString
}
private func validEngChars(engChars: [Character]) -> Bool {
    for char in engChars {
        let s = String(char).unicodeScalars
        if !(s[s.startIndex].value <= 90 && s[s.startIndex].value >= 65) && !(s[s.startIndex].value <= 57 && s[s.startIndex].value >= 48) && !(s[s.startIndex].value == 32) {
            return false
        }
    }
    return true
}
private func validSingleEngChar(engChar: Character) -> Bool {
    let s = String(engChar).unicodeScalars
    if !(s[s.startIndex].value <= 90 && s[s.startIndex].value >= 65) && !(s[s.startIndex].value <= 57 && s[s.startIndex].value >= 48) && !(s[s.startIndex].value == 32) {
        return false
    }
    return true
}
private func validMorseChars(morseChars: [String]) -> Bool {
    for char in morseChars {
        let s = char.unicodeScalars
        if (![32, 45, 46, 47].contains(s[s.startIndex].value)) {
            return false
        }
    }
    return true
}
private func validSingleMorseChar(morseChar: Character) -> Bool {
    let s = String(morseChar).unicodeScalars
    if (![32, 45, 46, 47].contains(s[s.startIndex].value)) {
        return false
    }
    return true
}
