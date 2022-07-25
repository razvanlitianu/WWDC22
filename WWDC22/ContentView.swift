//
//  ContentView.swift
//  WWDC22
//
//  Created by razvan.litianu on 20.06.2022.
//

import SwiftUI

enum Route: String, CaseIterable, Hashable {
    case markdown = "Markdown"
    case bottomSheet = "Bottom Sheet"
    case chart = "Chart"
    case layout = "Layout Protocol"
    case viewfit = "View That Fits"
    case variableSymbol = "Variable SF Symbols"
    case animatingVariableSymbol = "Animating SF Symbols"
    case gradient = "Gradient"
    case sharedView = "Share View"
    case draggableView = "Draggable View - Transferable"
}

extension Route: Identifiable {
    var id: Self { self }
}

extension Route {
    @ViewBuilder
    var destination: some View {
        Group {
            switch self {
            case .markdown:
                MarkDownView()
            case .bottomSheet:
                BottomSheet()
            case .chart:
                Chart()
            case .layout:
                LayoutProtocol()
            case .viewfit:
                ViewFit()
            case .variableSymbol:
                VariableSFSymbolView()
            case .gradient:
                GradientListExampleView()
            case .sharedView:
                SharedView()
            case .draggableView:
                DraggableView()
            case .animatingVariableSymbol:
                AnimatingSFSymbolView()
            }
        }
        .navigationTitle(self.rawValue)
    }
}

struct ContentView: View {
    @State private var selection: Route? = nil // Nothing selected by default.

    var body: some View {
        NavigationSplitView {
            List(Route.allCases, selection: $selection) { route in
                NavigationLink(route.rawValue, value: route)
            }
            .navigationTitle("WWDC22")
        } detail: {
            ZStack { // beta hack
                if let route = selection {
                    route.destination
                } else {
                    Text("Pick a color")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
