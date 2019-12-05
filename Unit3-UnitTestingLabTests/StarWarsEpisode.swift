//
//  StarWarsEpisode.swift
//  Unit3-UnitTestingLabTests
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import XCTest
@testable import Unit3_UnitTestingLab

let fileNameStarWars = "starWars"
let extStarWars = "json"


class StarWarsEpisode: XCTestCase {

   func testHowManyEpisodes() {
       
   //arrange
       let expectedCount = 7
       let data = Bundle.readRawJSONData(filename: fileNameStarWars, ext: extStarWars)
       
       //act
    let episode = Episode.getEpisode(for: data)
    
    // assert
    XCTAssertEqual(expectedCount, episode.count)
       
   }
    
    func testFirstEpisodeTitle() {
        // arrange
        let expectedTitle = "A New Hope"
        let firstTitle = getEpisodes().first
        // act
        let title = firstTitle?.title
        // assert
        XCTAssertEqual(expectedTitle, title)
    }

}

extension StarWarsEpisode {
    func getRawDataSW() -> Data {
           let data = Bundle.readRawJSONData(filename: fileNameStarWars, ext: extStarWars)
           return data
       }
       
      func getEpisodes() -> [EpisodeData] {
          let data = getRawDataSW()
        let episodes = Episode.getEpisode(for: data)
        return episodes
      }
}
