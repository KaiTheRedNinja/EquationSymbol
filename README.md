# EquationSymbol

Example: (quadratic equation)
```swift
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
```
