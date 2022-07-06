//
//  ViewFit.swift
//  WWDC23
//
//  Created by razvan.litianu on 13.06.2022.
//

import SwiftUI

struct ViewFit: View {
    var body: some View {
        ChildView()
            .frame(width: 1000)
    }
}

struct ChildView: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            // First View
            HStack{
                contactView
                Text("Litianu Razvan Florentin")
                    .fixedSize(horizontal: true, vertical: false)
            }
            // Second View
            HStack{
                contactView
                Text("Litianu Razvan")
                    .fixedSize(horizontal: true, vertical: false)
            }
            // Third View
            HStack {
                contactView
                Text ("Razvan")
                    .fixedSize(horizontal: true, vertical: false)
            }
            
            contactView
        }
    }
    
    var contactView: some View {
        ZStack {
            Circle()
                .frame(width: 44, height: 44)
            Text("LR")
                .foregroundColor(.white)
        }
    }
}

struct ViewFit_Previews: PreviewProvider {
    static var previews: some View {
        ViewFit()
    }
}
