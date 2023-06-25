//
//  AdditionGroup,SubtractionGroup.swift
//  electronicEquation
//
//  Created by Kai Quan Tay on 30/3/23.
//

import SwiftUI

public struct AdditionGroup<Left: EquationSymbolProtocol, Right: EquationSymbolProtocol>: EquationGroupProtocol {
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
            Text("+")
                .padding(.horizontal, -4)
            secondChild
        }
        .padding(0)
    }
}

public struct SubtractionGroup<Left: EquationSymbolProtocol, Right: EquationSymbolProtocol>: EquationGroupProtocol {
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
            Text("-")
                .padding(.horizontal, -4)
            secondChild
        }
        .padding(0)
    }
}

public struct RecursiveLRGroup<Content: View, Item: Hashable>: EquationSymbolProtocol {
    @Updating var data: [Item]

    var content: (Item, [Item], AnyView) -> Content

    public init(data: [Item], @ViewBuilder content: @escaping (Item, [Item], AnyView) -> Content) {
        self._data = .init(wrappedValue: data)
        self.content = content
    }

    @ViewBuilder
    public var body: some View {
        if !data.isEmpty {
            let nextData = Array(data.dropFirst())
            content(data.first!, nextData, AnyView(
                RecursiveLRGroup(data: nextData, content: content)
            ))
        }
    }
}

@propertyWrapper
public struct Updating<Value>: DynamicProperty {
    public var wrappedValue: Value { closure() }
    private var closure: () -> Value

    public init(wrappedValue: @escaping @autoclosure () -> Value) {
        self.closure = wrappedValue
    }
}
