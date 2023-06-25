//
//  EquationSymbolProtocol.swift
//  electronicEquation
//
//  Created by Kai Quan Tay on 30/3/23.
//

import SwiftUI

public typealias EquationSymbolProtocol = View

public protocol EquationContainerProtocol: EquationSymbolProtocol {
    associatedtype Child = EquationSymbolProtocol

    var child: Child { get }
}

public protocol EquationGroupProtocol: EquationSymbolProtocol {
    associatedtype FirstChild = EquationSymbolProtocol
    associatedtype SecondChild = EquationSymbolProtocol

    var firstChild: FirstChild { get }
    var secondChild: SecondChild { get }

    init(@ViewBuilder contents: () -> TupleView<(FirstChild, SecondChild)>)
}

public struct ValueSymbol: EquationSymbolProtocol {
    var value: UnitData
    var selectable: Bool = false
    @Binding var selection: UnitData

    public init(string: String) {
        self.init(value: .init(equationSymbol: string,
                               unitName: "",
                               unitSymbol: "",
                               explanation: ""))
    }

    public init(value: UnitData) {
        self.value = value
        self.selectable = false
        self._selection = .constant(.none)
    }

    public init(value: UnitData, selection: Binding<UnitData>) {
        self.value = value
        self.selectable = true
        self._selection = selection
    }

    public var body: some View {
        ZStack {
            if selectable {
                Button {
                    withAnimation {
                        selection = value
                    }
                } label: {
                    Text(value.equationSymbol)
                        .font(.system(.largeTitle, design: .serif))
                }
                .buttonStyle(.bordered)
                .tint(selection == value ? .accentColor : nil)
            } else {
                Text(value.equationSymbol)
                    .font(.system(.largeTitle, design: .serif))
                    .padding(0)
            }
        }
    }
}

public struct EmptySymbol: EquationSymbolProtocol {
    public var body: some View {
        EmptyView()
            .padding(0)
    }
}
