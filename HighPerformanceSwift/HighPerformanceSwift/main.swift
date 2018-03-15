//
//  main.swift
//  HighPerformanceSwift
//
//  Created by Grzegorz Aperlinski on 15/03/2018.
//  Copyright © 2018 Fandom. All rights reserved.
//

import Foundation

struct Wombat {
    var name = "Bob"
    var meh1 = NSAttributedString()
    var meh2 = NSAttributedString()
    var meh3 = NSAttributedString()
}

var item = Wombat()
print("Step 1", CFGetRetainCount(item))

let baz = item
print("Step 2", CFGetRetainCount(item))

let array = [item, baz]
print("Step 3", CFGetRetainCount(item))

func doStuff(with item: Wombat) {
    // RETAIN
    print("Step 4", CFGetRetainCount(item))
    // RELEASE
}

doStuff(with: item)

for thing in array {
    // RETAIN
    print("Step 5", CFGetRetainCount(item))
    // RELEASE
}
