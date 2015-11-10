//
//  DiamondHierarchyExample.swift
//  SwiftProtocolCastMemoryLeak
//
//  Created by Lukas Kubanek on 10/11/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

// ======================================================= //
// MARK: - Diamond Hierarchy Example
// ======================================================= //

internal final class DiamondHierarchyExample: Example {
    
    func execute() {
        // Construct an instance whose type is set to the base protocol.
        let instance: Base = Concrete1(valueForBranchA: "1", valueForBranchB: "2")
        
        // Conditionally downcast the instance to a concrete struct.
        if let castedConcreteInstance = instance as? Concrete2 {
            print(castedConcreteInstance)
        }
    }
    
}

// ======================================================= //
// MARK: - Resources
// ======================================================= //

private protocol Base {}

private protocol BranchA: Base {
    var valueForBranchA: String { get }
}

private protocol BranchB: Base {
    var valueForBranchB: String { get }
}

private struct Concrete1: BranchA, BranchB {
    
    private init(valueForBranchA: String, valueForBranchB: String) {
        self.valueForBranchA = valueForBranchA
        self.valueForBranchB = valueForBranchB
    }
    
    private let valueForBranchA: String
    private let valueForBranchB: String
    
}

private struct Concrete2: BranchA, BranchB {
    
    private init(valueForBranchA: String, valueForBranchB: String) {
        self.valueForBranchA = valueForBranchA
        self.valueForBranchB = valueForBranchB
    }
    
    private let valueForBranchA: String
    private let valueForBranchB: String
    
}