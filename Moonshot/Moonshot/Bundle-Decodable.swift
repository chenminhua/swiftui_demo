//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by 陈敏华 on 4/9/20.
//  Copyright © 2020 陈敏华. All rights reserved.
//

import Foundation

//extension Bundle {
//    func decode(_ file: String) -> [Astronaut] {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//
//        let decoder = JSONDecoder()
//
//        guard let loaded = try? decoder.decode([Astronaut].self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//
//        return loaded
//    }
//}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
