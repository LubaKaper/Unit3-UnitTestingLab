//
//  StarWarsModel.swift
//  Unit3-UnitTestingLab
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import Foundation

struct Episode: Decodable {
    var results: [EpisodeData]
}

struct EpisodeData: Decodable {
    var title: String
    var openingCrawl: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
        
    }
}

extension Episode {
    static func getEpisode(for data: Data) -> [EpisodeData] {
        var episodeLines = [EpisodeData]()
        guard let fileURL = Bundle.main.url(forResource: "starWars", withExtension: "json") else {
        fatalError("could not locate json file")
        }
        do {
             let data = try Data(contentsOf: fileURL)
           
             let starWarsData = try JSONDecoder().decode(Episode.self, from: data)
            episodeLines = starWarsData.results
         } catch {
             fatalError("failed to load contents \(error)")
         }
        
        return episodeLines
    }
}
