//
//  Chart.swift
//  WWDC23
//
//  Created by razvan.litianu on 13.06.2022.
//

import Charts
import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let index: Int
    let value: Double
}

struct Chart: View {
    @State private var items: [Item] = [
        .init(index: 0, value: 1),
        .init(index: 1, value: 5),
        .init(index: 2, value: 0),
        .init(index: 3, value: 7),
        .init(index: 4, value: 4)
    ]

    var body: some View {
        Charts.Chart(items) { item in
//            LineMark(
//                x: .value("Index", item.index),
//                y: .value("Value", item.value)
//            )

            BarMark(
                x: .value("Index", item.index),
                yStart: .value("Start", 0),
                yEnd: .value("End", item.value)
            )
            .foregroundStyle(by: .value("Value", item.value))
        }
    }
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart()
    }
}
