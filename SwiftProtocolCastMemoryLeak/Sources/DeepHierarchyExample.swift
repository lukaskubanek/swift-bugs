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
    
    internal init(useWorkaround: Bool = false) {
        self.useWorkaround = useWorkaround
    }
    
    internal let useWorkaround: Bool
    
    internal func execute() {
        // Construct an instance whose type is set to the base protocol.
        let instance: Base = Concrete1(value: "X")
        
        if !useWorkaround {
            // Conditionally downcast the instance to a concrete struct.
            if let castedConcreteInstance = instance as? Concrete2 {
                print(castedConcreteInstance)
            }
        } else {
            // Conditionally downcast the instance to an additional protocol which is inserted to the hierarchy
            // and implemented *only* by `Concrete2`. This check garantees that the variable can contain only
            // instances of `Concrete2`.
            guard let castedIntermediateInstance = instance as? IntermediateForConcrete2 else { return }
            
            // If we know that the variable contains an instance of `Concrete2` we can conditionally cast it
            // to its proper type without causing a memory leak.
            guard let castedConcreteInstance = castedIntermediateInstance as? Concrete2 else { return }
            
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

// ======================================================= //
// MARK: - Workaround Extensions
// ======================================================= //

private protocol IntermediateForConcrete2: Intermediate {}

extension Concrete2: IntermediateForConcrete2 {}
