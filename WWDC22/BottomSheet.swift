//
//  BottomSheet.swift
//  WWDC23
//
//  Created by razvan.litianu on 13.06.2022.
//

import SwiftUI

struct BottomSheet: View {
    @State private var showSheet = false

    var body: some View {
        customDetent
    }

    var defaultDetent: some View {
        Button("Show Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            Text("Hello from the SwiftUI sheet!")
                .presentationDetents([.medium, .large])
        }
    }

    var customDetent: some View {
        Button("Show Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            Text("Hello from the SwiftUI sheet!")
                .presentationDetents([
                    .fraction(0.2),
                    .height(600),
                    .large
                ])
        }
    }
}

struct Popover: View {
    @State private var showPopover = false

    var body: some View {
        Button("Show Popover") {
            showPopover = true
        }
        .popover(isPresented: $showPopover) {
            Text("Hello from the SwiftUI popover!")
                .presentationDetents([.medium, .large])
        }
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
        Popover()
//            .previewDevice("iPad")
    }
}
