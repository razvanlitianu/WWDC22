//
//  ColumnNavigation.swift
//  WWDC22
//
//  Created by razvan.litianu on 13.07.2022.
//

import SwiftUI

struct OldColumnNavigationView: View {
    var body: some View {
        NavigationView {
            Text("Sidebar")
            Text("Content")
            Text("Detail")
        }
    }
}

struct NewColumnNavigationView: View {
    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
        } content: {
            Text("Content")
        } detail: {
            Text("Detail")
        }
    }
}

struct OldColumnNavigation_Previews: PreviewProvider {
    static var previews: some View {
        OldColumnNavigationView()
    }
}

struct NewColumnNavigation_Previews: PreviewProvider {
    static var previews: some View {
        NewColumnNavigationView()
    }
}
