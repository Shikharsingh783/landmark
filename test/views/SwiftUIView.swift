//
//  SwiftUIView.swift
//  test
//
//  Created by Shikhar Singh on 18/09/24.
//

import SwiftUI

struct SwiftUIView: View {
    var image: Image
    var body: some View {
        image.clipShape(Circle()).overlay{
            Circle().stroke(.white,lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

#Preview {
    SwiftUIView(image: Image("turtlerock"))
}
