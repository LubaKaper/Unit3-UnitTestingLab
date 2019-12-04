//
//  JokeModel.swift
//  Unit3-UnitTestingLab
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import Foundation




struct JokeComponents: Decodable {
    var type: String
    var setup: String
    var punchline: String
}

extension JokeComponents {
    static func getJoke(from data: Data) -> [JokeComponents] {
       var jokeInfos = [JokeComponents]()
        guard let fileURL = Bundle.main.url(forResource: "jokes", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let jokesData = try JSONDecoder().decode([JokeComponents].self, from: data)
            jokeInfos = jokesData
        } catch {
            fatalError("failed to load contents \(error)")
        }
        return jokeInfos
    }
}
