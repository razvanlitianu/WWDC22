//
//  VariableSFSymbolView.swift
//  WWDC22
//
//  Created by razvan.litianu on 05.07.2022.
//

import SwiftUI
import Combine

enum SymbolVariance {
    case start
    case step1
    case step2
    case end
    
    var next: SymbolVariance {
        switch self {
        case .start:
            return .step1
        case .step1:
            return .step2
        case .step2:
            return .end
        case .end:
            return .start
        }
    }
    
    var value: Double {
        switch self {
        case .start:
            return 0
        case .step1:
            return 0.2
        case .step2:
            return 0.6
        case .end:
            return 1
        }
    }
}

struct VariableSFSymbolView: View {
    @State var subs: [AnyCancellable] = []
    var body: some View {
        VStack {
            Image(systemName: "ellipsis.message.fill", variableValue: 0)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
            Image(systemName: "ellipsis.message.fill", variableValue: 0.2)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
            Image(systemName: "ellipsis.message.fill", variableValue: 0.6)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
            Image(systemName: "ellipsis.message.fill", variableValue: 1)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct AnimatingSFSymbolView: View {
    @State var variance: SymbolVariance = .start
    @State var subs: [AnyCancellable] = []
    var body: some View {
        Image(systemName: "ellipsis.message.fill", variableValue: variance.value)
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
                variance = variance.next
            }.store(in: &subs)
    }

}

struct VariableSFSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        VariableSFSymbolView()
        AnimatingSFSymbolView()
    }
}
