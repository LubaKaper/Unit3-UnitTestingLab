//
//  Bundle+Extansion.swift
//  Unit3-UnitTestingLab
//
//  Created by Liubov Kaper  on 12/4/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import Foundation

extension Bundle {
    static func readRawJSONData(filename: String, ext: String) -> Data {
        
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("resource with filename \(filename) not found")
        }
        
        var data: Data!
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("contents not founf error \(error)")
        }
        return data
    }
}
