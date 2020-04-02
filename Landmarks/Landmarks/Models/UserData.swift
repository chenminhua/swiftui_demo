//
//  UserData.swift
//  Landmarks
//
//  Created by 陈敏华 on 4/2/20.
//  Copyright © 2020 陈敏华. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
