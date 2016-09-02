# SwiftyMorse
A small library that allows developers to translate to/from English/Morse Code.
# Installation
### Carthage
Add this to your Cartfile:  
```` github "mnocito/SwiftyMorse"  ````
### Manually
In a workspace, add SwiftyMorse.xcodeproj to your root project directory.  
In a project, add the SwiftyMorse.swift file to the project tree.
# Requirements
• iOS 7.0+ / OS X 10.9+
• Xcode 7
# Usage
```swift
import SwiftyMorse
SwiftyMorse.translateTo("Morse", "Hi there") // returns ".... .. / - .... . .-. ."
SwiftyMorse.translateTo("English", ".... .. / - .... . .-. .") // returns "HI THERE"
let invalidEnglishText = "Hi there! ][[;';lp;'l"
let validEnglishText = SwiftyMorse.strip("English", invalidEnglishText) // returns "Hi there"
let invalidMorseText = ".-. / .-This is some english"
let validMorseText = SwiftyMorse.strip("Morse", invalidMorseText) // returns ".-. / .-"
```
# Methods
### translateTo(language, text)
Translate a string to a language, in this case either Morse or English.  
If the ````language```` is neither Morse nor English, the function throws an ````UnsupportedLanguage```` error. See usage for examples. 
Likewise, if the ````text```` is invalid, the function throws an ````InvalidString```` error.
### strip(language, text)
Strips all invalid characters from a string with a specified language, in this case either Morse or English. See usage for examples.  
If the ````language```` is neither Morse nor English, the function throws an ````UnsupportedLanguage```` error.  
