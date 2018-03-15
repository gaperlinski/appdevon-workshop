//
//  main.swift
//  HighPerformanceSwift
//
//  Created by Grzegorz Aperlinski on 15/03/2018.
//  Copyright © 2018 Fandom. All rights reserved.
//

import Foundation

struct MyType {
    let url: URL
    let id: UUID
    var site: String
}

var urls = [MyType]()

for _ in 1...1000 {
    let item = MyType(url: URL(string: "https://www.apple.com")!,
                      id: UUID(),
                      site: "Apple.com")
    urls.append(item)
}
