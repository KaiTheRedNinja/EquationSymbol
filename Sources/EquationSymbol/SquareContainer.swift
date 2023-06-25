//
//  SquareContainer.swift
//  electronicEquation
//
//  Created by Kai Quan Tay on 30/3/23.
//

import SwiftUI

public struct SquareContainer<Child: EquationSymbolProtocol>: EquationContainerProtocol {
    public var child: Child

    public init(@ViewBuilder contents: () -> Child) {
        self.child = contents()
    }

    public var body: some View {
        child
            .padding([.vertical], 5)
            .padding(.trailing, 7)
            .overlay(alignment: .topTrailing) {
                Text("2")
                    .font(.system(.body, design: .serif))
            }
    }
}

public struct SquareRootContainer<Child: EquationSymbolProtocol>: EquationContainerProtocol {
    public var child: Child

    public init(@ViewBuilder contents: () -> Child) {
        self.child = contents()
    }

    public var body: some View {
        child
            .padding(.top, 2)
            .padding(.leading, 12)
            .overlay(alignment: .topLeading) {
                SquareRootShape()
                    .stroke(.black, lineWidth: 2)
                    .padding(.bottom, 8)
            }
    }

    struct SquareRootShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            // top part of the tick, starting at top right

            let tickEnd = rect.minX+8

            path.move(to: .init(x: rect.maxX, y: rect.minY))
            path.addLine(to: .init(x: tickEnd, y: rect.minY))
            path.addLine(to: .init(x: (rect.minX+tickEnd)/2+1, y: rect.maxY))
            path.addLine(to: .init(x: (rect.minX+tickEnd)/2, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.midY))
            return path
        }
    }
}
