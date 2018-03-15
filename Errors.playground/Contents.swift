//: Playground - noun: a place where people can play

import UIKit

let fm =  FileManager.default
let bundle = Bundle.main

let contents = fm.contentsOfDirectory(atPath: bundle.resourcePath!)

let savedText = (try? String(contentsOfFile: "myfile.txt")) ?? "Example text here"

let str = ""
_ = try? str.write(to: URL("file://example.txt")!, atomically: true, encoding: .utf8)
