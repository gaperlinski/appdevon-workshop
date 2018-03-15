//: Playground - noun: a place where people can play

import UIKit

var total: Decimal = 0
var current: Decimal = 2

for i in 0 ..< 200 {
    print(current)
    total += current

    if i % 2 == 0 {
        current *= 2
    } else {
        current += 2
    }
}
