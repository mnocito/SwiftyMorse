//
//  SwiftyMorseTests.swift
//  SwiftyMorseTests
//
//  Created by Marco on 9/1/16.
//  Copyright © 2016 Marco. All rights reserved.
//

import Quick
import Nimble
import SwiftyMorse

class SwiftyMorseTests: QuickSpec {
    override func spec() {
        describe("translateTo") {
            it("translates morse code to english") {
                expect(SwiftyMorse.translateTo("English", text: ".... . .-.. .-.. --- / .-- --- .-. .-.. -..")).to(equal("HELLO WORLD"))
            }
            it("catches invalid morse code characters") {
                expect(SwiftyMorse.translateTo("English", text: "This is an invalid string because of the english characters.")).to(equal(""))
            }
            it("translaSwiftytes english to morse code") {
                expect(SwiftyMorse.translateTo("Morse", text: "Hello world")).to(equal(".... . .-.. .-.. --- / .-- --- .-. .-.. -.."))
            }
            it("catches invalid english characters") {
                expect(SwiftyMorse.translateTo("Morse", text: "This is an invalid string because of the punctuation!")).to(equal(""))
            }
            it("catches invalid languages") {
                expect(SwiftyMorse.translateTo("Gibberish", text: "The input string doesn't matter.")).to(equal("Error: Language Gibberish is not a supported language. Did you misspell something?"))
            }
        }
        describe("strip") {
            it("removes invalid morse code characters") {
                expect(SwiftyMorse.strip("Morse", text: "Strip all of this.")).to(equal("."))
            }
            it("removes invalid morse code characters pt 2") {
                expect(SwiftyMorse.strip("Morse", text: "fjljdagdl gadigldfj g g g g g g g  gs.-")).to(equal(".-"))
            }
            it("catches invalid languages") {
                expect(SwiftyMorse.strip("Gibberish", text: "The input string doesn't matter.")).to(equal("Error: Language Gibberish is not a supported language. Did you misspell something?"))
            }
        }
    }
    
}

