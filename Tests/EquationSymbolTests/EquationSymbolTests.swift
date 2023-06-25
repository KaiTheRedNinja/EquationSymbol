import XCTest
import SwiftUI
import EquationSymbol

final class EquationSymbolTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}

struct QuadraticEquation: View {
    var body: some View {
        EqualityGroup {
            ValueSymbol(string: "x")
            DivisionGroup {
                AdditionGroup {
                    MultiplicationGroup {
                        ValueSymbol(string: "2")
                        ValueSymbol(string: "a")
                    }
                    SquareRootContainer {
                        SubtractionGroup {
                            SquareContainer {
                                ValueSymbol(string: "b")
                            }
                            MultiplicationGroup {
                                ValueSymbol(string: "4")
                                MultiplicationGroup {
                                    ValueSymbol(string: "a")
                                    ValueSymbol(string: "c")
                                }
                            }
                        }
                    }
                }
                MultiplicationGroup {
                    ValueSymbol(string: "2")
                    ValueSymbol(string: "a")
                }
            }
        }
    }
}
