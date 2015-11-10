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
        DeepHierarchyExample().execute()
        DiamondHierarchyExample().execute()
    }
    
}
