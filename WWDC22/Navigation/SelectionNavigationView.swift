//
//  SelectionNavigationView.swift
//  WWDC22
//
//  Created by Razvan on 15.07.2022.
//

import SwiftUI

struct ColorDetail: View {
    let color: Color

    var body: some View {
        Circle()
            .foregroundColor(color)
    }
}

struct NewSelectionNavigationView: View {
    let colors: [Color] = [.purple, .pink, .orange]
    @State private var selection: Color? = nil // Nothing selected by default.
    
    var body: some View {
        NavigationSplitView {
            List(colors, id: \.self, selection: $selection) { color in
                NavigationLink(color.description, value: color)
            }
        } detail: {
            ZStack { // beta hack
                if let color = selection {
                    ColorDetail(color: color)
                } else {
                    Text("Pick a color")
                }
            }
        }
    }
}

struct OldSelectionNavigationView: View {
    let colors: [Color] = [.purple, .pink, .orange]
    @State private var selection: Color? = nil // Nothing selected by default.

    var body: some View {
        NavigationView { // This is deprecated.
            List {
                ForEach(colors, id: \.self) { color in
                    NavigationLink(color.description, tag: color, selection: $selection) {
                        ColorDetail(color: color)
                    }
                }
            }
            Text("Pick a color")
        }
    }
}

struct OldSelectionNavigation_Previews: PreviewProvider {
    static var previews: some View {
        OldSelectionNavigationView()
    }
}

struct NewSelectionNavigation_Previews: PreviewProvider {
    static var previews: some View {
        NewSelectionNavigationView()
    }
}
