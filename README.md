# Swift Bugs

This is a collection of bugs in Swift I encountered during my development adventures.

## `SwiftStructsMemoryLeak`

- A bug which causes memory leaks for a special combination of protocol and generic structures.
- → see the [code](SwiftStructsMemoryLeak/Sources/AppDelegate.swift)
- [Stack Overflow Question](http://stackoverflow.com/questions/30628547/memory-leak-in-swift-structures-how-to-fix-this)
- [Post on Apple Dev Forum](https://forums.developer.apple.com/message/9643)
- Discovered in Swift 1.2
- Resolved in Xcode 7 beta 5 (with a beta version of Swift 2.0) ✔

## `SwiftProtocolCastMemoryLeak`

- A bug where downcasting in a protocol hierarchy causes memory leaks.
- → see the [code](SwiftProtocolCastMemoryLeak/Sources/)
- The bug is still present.
