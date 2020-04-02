//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 陈敏华 on 4/2/20.
//  Copyright © 2020 陈敏华. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
//            List(landmarkData, id: \.id) { landmark in
//                if !self.showFavoritesOnly || landmark.isFavorite {
//                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                        LandmarkRow(landmark: landmark)
//                    }
//                }
//            }
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData())
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
           

    }
}
