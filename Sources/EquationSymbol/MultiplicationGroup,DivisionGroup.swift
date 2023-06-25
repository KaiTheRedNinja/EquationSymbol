//
//  DivisionGroup.swift
//  electronicEquation
//
//  Created by Kai Quan Tay on 30/3/23.
//

import SwiftUI

public struct MultiplicationGroup<Left: EquationSymbolProtocol, Right: EquationSymbolProtocol>: EquationGroupProtocol {
    public var firstChild: Left
    public var secondChild: Right

    public init(@ViewBuilder contents: () -> TupleView<(Left, Right)>) {
        let value = contents().value
        self.firstChild = value.0
        self.secondChild = value.1
    }

    public var body: some View {
        HStack(alignment: .center) {
            firstChild
                .padding(.trailing, -3)
            secondChild
                .padding(.leading, -3)
        }
        .padding(0)
    }
}

public struct DivisionGroup<Top: EquationSymbolProtocol, Bottom: EquationSymbolProtocol>: EquationGroupProtocol {
    public var firstChild: Top
    public var secondChild: Bottom

    @State private var width: CGFloat = 10

    public init(@ViewBuilder contents: () -> TupleView<(Top, Bottom)>) {
        let value = contents().value
        self.firstChild = value.0
        self.secondChild = value.1
    }

    public var body: some View {
        VStack(alignment: .center) {
            firstChild
                .padding(.bottom, -10)
                .frame(minWidth: 60)
            Color.black
                .frame(width: width, height: 2)
            secondChild
                .padding(.top, -6)
                .frame(minWidth: 60)
        }
        .padding(0)
        .background {
            GeometryReader { geom in
                Color.white.opacity(0.005)
                    .onAppear {
                        width = geom.size.width
                    }
                    .onChange(of: geom.size.width) { _ in
                        width = geom.size.width
                    }
            }
        }
    }
}
