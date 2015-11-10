//
//  AppDelegate.swift
//  SwiftStructsMemoryLeak
//
//  Created by Lukas Kubanek on 03/06/15.
//  Copyright (c) 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

protocol Item {
    
    var value: String { get }
    
}

struct FooItem<T>: Item {
    
    let value: String
    let additionalValue: T
    
    init(value: String, additionalValue: T) {
        self.value = value
        self.additionalValue = additionalValue
    }
    
}

struct ItemWrapper {
    
    let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let item = FooItem(value: "protocol value", additionalValue: "foo item value")
        let _ = ItemWrapper(item: item)
    }
    
}
