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
                expect{
                    try SwiftyMorse.translateTo("English", text: ".... . .-.. .-.. --- / .-- --- .-. .-.. -..")
                }.to(equal("HELLO WORLD"))
            }
            it("catches invalid morse code characters") {
                expect {
                    try SwiftyMorse.translateTo("English", text: "This is an invalid string because of the english characters.")
                }.to(throwError())
            }
            it("translates english to morse code") {
                expect {
                    try SwiftyMorse.translateTo("Morse", text: "Hello world")
                }.to(equal(".... . .-.. .-.. --- / .-- --- .-. .-.. -.."))
            }
            it("catches invalid english characters") {
                expect {
                    try SwiftyMorse.translateTo("Morse", text: "This is an invalid string because of the punctuation!")
                }.to(throwError())
            }
            it("catches invalid languages") {
                expect {
                    try SwiftyMorse.translateTo("Gibberish", text: "The input string doesn't matter.")
                    }.to(throwError())
            }
        }
        describe("strip") {
            it("removes invalid morse code characters") {
                expect {
                    try SwiftyMorse.strip("Morse", text: "Strip all of this.")
                }.to(equal("."))
            }
            it("removes invalid morse code characters pt 2") {
                expect {
                  try SwiftyMorse.strip("Morse", text: "fjljdagdl gadigldfj g g g g g g g  gs.- / .-")
                }.to(equal(".- / .-"))
            }
            it("catches invalid languages") {
                expect {
                    try SwiftyMorse.strip("Gibberish", text: "The input string doesn't matter.")
                    }.to(throwError())
            }
        }
    }
    
}

