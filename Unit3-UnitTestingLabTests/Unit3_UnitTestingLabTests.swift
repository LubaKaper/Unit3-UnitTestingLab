//
//  Unit3_UnitTestingLabTests.swift
//  Unit3-UnitTestingLabTests
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import XCTest
@testable import Unit3_UnitTestingLab

let filename = "jokes"
let ext  = "json"


class Unit3_UnitTestingLabTests: XCTestCase {

    func testHowManyJokes() {
        //arrange
        let expectedCount = 10
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        // act
        
        let joke = JokeComponents.getJoke(from: data)
        
        // assert
        XCTAssertEqual(expectedCount, joke.count)
        
    }
    
    func testSetupOfFirstJoke() {
        // arrange
        let firstJoke = getJokes().first
        let expectedSetup = "Why did the programmer quit his job?"
        
        // act
        let setup = firstJoke?.setup ?? "no joke"
        
        // assert
        XCTAssertEqual(expectedSetup, setup)
    }

}

extension Unit3_UnitTestingLabTests {
    func getRawData() -> Data {
           let data = Bundle.readRawJSONData(filename: filename, ext: ext)
           return data
       }
       
      func getJokes() -> [JokeComponents] {
          let data = getRawData()
        let jokes = JokeComponents.getJoke(from: data)
        return jokes
      }
}


