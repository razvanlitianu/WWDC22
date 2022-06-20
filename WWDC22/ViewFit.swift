//
//  ViewFit.swift
//  WWDC23
//
//  Created by razvan.litianu on 13.06.2022.
//

import SwiftUI

struct ViewFit: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            HStack {
                Image(systemName: "star")
                Text("Long text here")
            }

            VStack {
                Image(systemName: "star")
                Text("Long text here")
            }
        }    }
}

struct ViewFit_Previews: PreviewProvider {
    static var previews: some View {
        ViewFit()
    }
}
