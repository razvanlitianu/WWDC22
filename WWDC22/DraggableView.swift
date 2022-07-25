//
//  DraggableView.swift
//  WWDC22
//
//  Created by Razvan on 16.07.2022.
//

import SwiftUI

struct DraggableView: View {
    @State var image = Image(systemName: "person.crop.circle")
    
    var body: some View {
        ProfileView(image: image)
            .draggable(image)
            .dropDestination(for: Image.self) { items, location in
                if let image = items.first {
                    self.image = image
                    return true
                } else {
                    return false
                }
            }
            .toolbar {
                PasteButton(payloadType: Image.self) { items in
                    if let image = items.first {
                        self.image = image
                    }
                }
                .buttonBorderShape(.capsule)
            }
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DraggableView()
                .navigationTitle("Hello")
        }
    }
}

struct ProfileView: View {
    let image: Image
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 72, height: 72)
                .clipShape(Circle())
            VStack {
                Text("Litianu Razvan")
                    .font(.title)
                    .fontWeight(.medium)
                Text("iOS Developer")
            }
        }
    }
}
