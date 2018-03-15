//
//  main.swift
//  HighPerformanceSwift
//
//  Created by Grzegorz Aperlinski on 15/03/2018.
//  Copyright © 2018 Fandom. All rights reserved.
//

import Foundation

protocol SomeProtocol {
    var site: String { get set }
}

struct MyType: SomeProtocol {
    var site: String = "Apple.com"
}

func doA(_ thing: SomeProtocol) {
    doB(thing)
}

func doB(_ thing: SomeProtocol) {
    doC(thing)
}

func doC(_ thing: SomeProtocol) {
    print(thing.site)
}

// Dynamic dispatch
//func doThing(value: SomeProtocol) {
//    print(value.site)
//}

// Static dispatch
// Will attempt to create a specialized function at compile type
// e.g. doThing(value: MyType)
func doThing<T: SomeProtocol>(value: T) {
    print(value.site)
}

var items: [MyType] = [MyType()]

for _ in 1...1000 {
//    doA(items[0])
    doThing(value: items[0])
}
