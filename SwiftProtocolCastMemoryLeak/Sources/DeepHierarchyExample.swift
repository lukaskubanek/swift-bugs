//
//  DeepHierarchyExample.swift
//  SwiftProtocolCastMemoryLeak
//
//  Created by Lukas Kubanek on 10/11/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

// ======================================================= //
// MARK: - Deep Hierarchy Example
// ======================================================= //

internal final class DeepHierarchyExample: Example {
    
    internal func execute() {
        // Construct an instance whose type is set to the base protocol.
        let instance: Base = Concrete1(value: "X")
        
        // Conditionally downcast the instance to a concrete struct.
        if let castedConcreteInstance = instance as? Concrete2 {
            print(castedConcreteInstance)
        }
    }
    
}

// ======================================================= //
// MARK: - Resources
// ======================================================= //

private protocol Base {
    var valueForBase: String { get }
}

private protocol Intermediate: Base {
    var valueForIntermediate: String { get }
}

private struct Concrete1: Intermediate {
    
    private init(value: String) {
        self.valueForIntermediate = value
        self.valueForBase = value
    }
    
    private let valueForBase: String
    private let valueForIntermediate: String
    
}

private struct Concrete2: Intermediate {
    
    private init(value: String) {
        self.valueForIntermediate = value
        self.valueForBase = value
    }
    
    private let valueForBase: String
    private let valueForIntermediate: String
    
}

