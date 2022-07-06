//
//  GradientExampleView.swift
//  WWDC22
//
//  Created by razvan.litianu on 05.07.2022.
//

import SwiftUI

struct GradientExampleView: View {
    let colors: [Color] = [.blue, .cyan, .green, .yellow, .orange, .red, .purple]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(colors, id: \.self) { color in
                Rectangle().fill(color.gradient)
            }
        }
        .mask(
            Image(systemName: "applelogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
        )
    }
}


struct GradientListExampleView: View {
    let colors: [Color] = [.blue, .cyan, .green, .yellow, .orange, .red, .purple]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(colors, id: \.self) { color in
                Rectangle().fill(color.gradient)
            }
        }
    }
}

struct GradientExampleView_Previews: PreviewProvider {
    static var previews: some View {
        GradientExampleView()
        GradientListExampleView()
    }
}
