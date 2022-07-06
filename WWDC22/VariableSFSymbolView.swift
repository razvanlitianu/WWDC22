//
//  VariableSFSymbolView.swift
//  WWDC22
//
//  Created by razvan.litianu on 05.07.2022.
//

import SwiftUI
import Combine

struct VariableSFSymbolView: View {
    @State var count: Double = 0
    @State var subs: [AnyCancellable] = []
    var body: some View {
        Image(systemName: "ellipsis.message.fill", variableValue: count)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .padding()
            .onAppear {
                start()
            }
    }

    func start() {
        Timer.publish(every: 0.75, on: .main, in: .default)
            .autoconnect()
            .sink { _ in
                switch self.count {
                    case 0.0:
                        self.count = 0.2
                    case 0.2:
                        self.count = 0.6
                    case 0.6:
                        self.count = 1.0
                    default:
                        self.count = 0.0
                }
            }.store(in: &subs)
    }

}

struct VariableSFSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        VariableSFSymbolView()
    }
}
