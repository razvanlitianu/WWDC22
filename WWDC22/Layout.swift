//
//  Layout.swift
//  WWDC23
//
//  Created by razvan.litianu on 13.06.2022.
//

import SwiftUI

struct LayoutProtocol: View {
    var body: some View {
        let layout = AnyLayout(EqualWidthHStack())
        return layout {
            Text("Hello...")
                .foregroundColor(.red)
            Text("Hello.........")
                .foregroundColor(.green)
            Text("Hello..............")
                .foregroundColor(.blue)
        }
    }
}

struct EqualWidthHStack: Layout {
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        let maxSize = maxSize(subviews: subviews)
        let spacings = spacings(subviews: subviews)
        let totalSpacing = spacings.reduce(0.0, +)

        return CGSize(
            width: maxSize.width * CGFloat(subviews.count) + totalSpacing,
            height: maxSize.height
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        let maxSize = maxSize(subviews: subviews)
        let spacing = spacings(subviews: subviews)

        let size = ProposedViewSize(
            width: maxSize.width,
            height: maxSize.height
        )
        var x = bounds.minX + maxSize.width / 2

        for index in subviews.indices {
            subviews[index].place(
                at: CGPoint(x: x, y: bounds.midY),
                anchor: .center,
                proposal: size
            )
            x += maxSize.width + spacing[index]
        }
    }

    private func spacings(subviews: Subviews) -> [CGFloat] {
        let spacing: [CGFloat] = subviews.indices.map { index in
            guard index < subviews.count - 1 else {
                return 0.0
            }

            return subviews[index].spacing.distance(
                to: subviews[index + 1].spacing,
                along: .horizontal
            )
        }
        return spacing
    }

    private func maxSize(subviews: Subviews) -> CGSize {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let maxSize: CGSize = subviewSizes.reduce(.zero) { current, size in
            CGSize(
                width: max(current.width, size.width),
                height: max(current.height, size.height)
            )
        }
        return maxSize
    }
}

struct LayoutProtocol_Previews: PreviewProvider {
    static var previews: some View {
        LayoutProtocol()
    }
}
