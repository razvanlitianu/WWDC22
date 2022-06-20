//
//  Navigation.swift
//  WWDC23
//
//  Created by razvan.litianu on 13.06.2022.
//

import SwiftUI

struct User: Identifiable, Hashable {
    let name: String

    var id: String { name }
}

struct UserView: View {
    let user: User

    var body: some View {
        Text(user.name)
    }
}

struct Navigation: View {
    @State private var path: [User] = []
    @State private var users: [User] = [
        .init(name: "Majid")
    ]

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(users) { user in
                    NavigationLink(user.name, value: user)
                }

            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserView(user: user)
                    .navigationTitle(user.name)
            }
        }
//        .onAppear {
//            path.append(
//                contentsOf: [
//                    .init(name: "John"),
//                    .init(name: "Majid")
//                ]
//            )
//        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
