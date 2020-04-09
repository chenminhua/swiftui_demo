//
//  Mission.swift
//  Moonshot
//
//  Created by 陈敏华 on 4/9/20.
//  Copyright © 2020 陈敏华. All rights reserved.
//

import Foundation
//
//struct CrewRole: Codable {
//    let name: String
//    let role: String
//}
//
//struct Mission: Codable, Identifiable {
//    let id: Int
//    let launchDate: String?
//    let crew: [CrewRole]
//    let description: String
//}

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
