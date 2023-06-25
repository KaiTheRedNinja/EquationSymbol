//
//  UnitData.swift
//  electronicEquation
//
//  Created by Kai Quan Tay on 2/4/23.
//

import Foundation

public struct UnitData: RawRepresentable, Hashable {
    public typealias RawValue = String

    public init?(rawValue: String) {
        let values = rawValue.split(separator: "-/-").map({ String($0) })
        guard values.count == 4 else { return nil }
        self.equationSymbol = values[0]
        self.unitName = values[1]
        self.unitSymbol = values[2]
        self.explanation = values[3]
    }
    
    public init(equationSymbol: String,
                unitName: String,
                unitSymbol: String,
                explanation: String
    ) {
        self.equationSymbol = equationSymbol
        self.unitName = unitName
        self.unitSymbol = unitSymbol
        self.explanation = explanation
    }
    
    public var rawValue: String {
        [
            equationSymbol,
            unitName,
            unitSymbol,
            explanation
        ].joined(separator: "-/-")
    }
    
    public var equationSymbol: String
    public var unitName: String
    public var unitSymbol: String
    public var explanation: String
    
    public static let v: UnitData = .init(equationSymbol: "V",
                                          unitName: "Volt",
                                          unitSymbol: "V",
                                          explanation: "The potential difference between two points in a circuit")
    public static let i: UnitData = .init(equationSymbol: "I",
                                          unitName: "Ampere",
                                          unitSymbol: "A",
                                          explanation: "The rate of flow of charge between two points in a circuit")
    public static let r: UnitData = .init(equationSymbol: "R",
                                          unitName: "Ohm",
                                          unitSymbol: "Ω",
                                          explanation: "An object's opposition to the flow of electric current")
    public static let p: UnitData = .init(equationSymbol: "P",
                                          unitName: "Watt",
                                          unitSymbol: "W",
                                          explanation: "The rate of consumption of energy in an electric circuit")
    public static let w: UnitData = .init(equationSymbol: "W",
                                          unitName: "Joule",
                                          unitSymbol: "J",
                                          explanation: "The work done by the circuit")
    public static let q: UnitData = .init(equationSymbol: "Q",
                                          unitName: "Coulomb",
                                          unitSymbol: "C",
                                          explanation: "The electric charge passing through a circuit over time")
    public static let t: UnitData = .init(equationSymbol: "T",
                                          unitName: "Second",
                                          unitSymbol: "s",
                                          explanation: "The amount of time that has elapsed")
    public static let none: UnitData = .init(equationSymbol: "?", unitName: "?", unitSymbol: "?", explanation: "?")
}
