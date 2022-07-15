//
//  ColumnNavigation.swift
//  WWDC22
//
//  Created by razvan.litianu on 13.07.2022.
//

import SwiftUI

struct ColorDetail: View {
    let color: Color

    var body: some View {
        Circle()
            .foregroundColor(color)
    }
}

struct SelectionNavigationView: View {
    let colors: [Color] = [.purple, .pink, .orange]
    @State private var selection: Color? = nil // Nothing selected by default.

    var body: some View {
//        old
        new
    }

    var old: some View {
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

    var new: some View {
        NavigationSplitView {
            List(colors, id: \.self, selection: $selection) { color in
                NavigationLink(color.description, value: color)
            }
        } detail: {
            ZStack { // hack
                if let color = selection {
                    ColorDetail(color: color)
                } else {
                    Text("Pick a color")
                }
            }
        }
    }
}

struct ColumnNavigationView: View {
    var body: some View {
//        old
        new
    }

    var old: some View {
        NavigationView {
            Text("Sidebar")
            Text("Content")
            Text("Detail")
        }
    }

    var new: some View {
        NavigationSplitView {
            Text("Nav")
        } content: {
            Text("Content")
        } detail: {
            Text("Detail")
        }
    }
}

struct ColumnNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ColumnNavigationView()
    }
}

struct SelectionNavigation_Previews: PreviewProvider {
    static var previews: some View {
        SelectionNavigationView()
    }
}
