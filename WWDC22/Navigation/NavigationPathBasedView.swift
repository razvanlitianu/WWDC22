//
//  NavigationPathBasedView.swift
//  WWDC22
//
//  Created by Razvan on 15.07.2022.
//

import SwiftUI

struct NavigationPathBasedView: View {
    @State private var path = NavigationPath()
    private var users: [User] = [
        .init(name: "Razvan"),
        .init(name: "Foo"),
        .init(name: "Bar")
    ]
    private let colors: [Color] = [.purple, .pink, .orange]

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Users") {
                    ForEach(users) { user in
                        NavigationLink(user.name, value: user)
                    }
                }
                
                Section("Colors") {
                    ForEach(colors, id: \.self) { color in
                        NavigationLink(color.description, value: color)
                    }
                }

            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserView(user: user, pop: {})
                    .navigationTitle(user.name)
                    .toolbar(content: { randomButton })
            }
            .navigationDestination(for: Color.self) { color in
                ColorDetail(color: color)
                    .navigationTitle(color.description)
                    .toolbar(content: { randomButton })
            }
            .toolbar(content: { randomButton })
        }
    }
    
    func randomNavigation() {
        let value: any Hashable = Bool.random() ? users.randomElement()! : colors.randomElement()!
        path.append(value)
    }
    
    var randomButton: some View {
        Button("Navigate Random") {
            randomNavigation()
        }
    }
}

struct NavigationPathBasedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPathBasedView()
    }
}
