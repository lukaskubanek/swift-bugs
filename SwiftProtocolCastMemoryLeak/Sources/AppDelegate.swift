//
//  AppDelegate.swift
//  SwiftProtocolCastMemoryLeak
//
//  Created by Lukas Kubanek on 10/11/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        executeProtocolCast()
    }
    
}

// ======================================================= //
// MARK: - Example
// ======================================================= //

internal func executeProtocolCast() {
    // Construct a value whose type is set to the base protocol.
    let value: Base = Concrete1(valueForBranchA: "", valueForBranchB: "")
    
    // Cast the value to a concrete struct.
    if let castedConcreteValue = value as? Concrete2 {
        print(castedConcreteValue)
    }
}

// ======================================================= //
// MARK: - Sample Hierarchy
// ======================================================= //

internal protocol Base {}

internal protocol BranchA: Base {
    var valueForBranchA: String { get }
}

internal protocol BranchB: Base {
    var valueForBranchB: String { get }
}

internal struct Concrete1: BranchA, BranchB {
    
    internal init(valueForBranchA: String, valueForBranchB: String) {
        self.valueForBranchA = valueForBranchA
        self.valueForBranchB = valueForBranchB
    }
    
    internal let valueForBranchA: String
    internal let valueForBranchB: String
    
}

internal struct Concrete2: BranchA, BranchB {
    
    internal init(valueForBranchA: String, valueForBranchB: String) {
        self.valueForBranchA = valueForBranchA
        self.valueForBranchB = valueForBranchB
    }
    
    internal let valueForBranchA: String
    internal let valueForBranchB: String
    
}
