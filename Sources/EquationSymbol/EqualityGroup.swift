//
//  EqualityGroup.swift
//  electronicEquation
//
//  Created by Kai Quan Tay on 30/3/23.
//

import SwiftUI

public struct EqualityGroup<Left: EquationSymbolProtocol, Right: EquationSymbolProtocol>: EquationGroupProtocol {
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
            Text("=")
            secondChild
        }
        .padding(0)
    }
}
