//
//  CircleImage.swift
//  Landmarks
//
//  Created by 陈敏华 on 4/2/20.
//  Copyright © 2020 陈敏华. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    var body: some View {
        image
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))   // border
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
