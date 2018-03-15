//: Playground - noun: a place where people can play

import UIKit

//func lengthOf(strings: [String]) -> [Int] {
//    var result = [Int]()
//
//    for string in strings {
//        result.append(string.count)
//    }
//
//    return result
//}

func lengthOf(strings: [String]) -> [Int] {
    return strings.map{ $0.count }
}

lengthOf(strings: ["Paul", "Is", "The", "...?"])




// Mapping optional

let i: Int? = 10
let j = i.map { $0 * 2 }
print(j)

func fetchUsername(id: Int) -> String? {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let username = fetchUsername(id: 1989)
let formattedUsername = username.map { "Welcome, \($0)!" }


// Flatmap to reduce complexity

let num: String? = "5"
let int = num.flatMap { Int($0) } // vs let int = num.map { Int($0) }

let names = ["Taylor", "Paul", "Greg"]
let count = names.reduce(0) { $0 + $1.count }
print(count)


// Combining functional programming functions

let london = (name: "London", continent: "Europe", population: 8_000_000)
let paris = (name: "Paris", continent: "Europe", population: 2_500_000)
let tokyo = (name: "Tokio", continent: "Asia", population: 12_000_000)
let cities = [london, paris, tokyo]

precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator >>>: CompositionPrecedence

func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V) -> (T) -> V {
    return { rhs(lhs($0)) }
}

func generateNumber(max: Int) -> Int {
    let number = Int(arc4random_uniform(UInt32(max)))
    return number
}

func calculateFactors(number: Int) -> [Int] {
    return (1...number).filter { number % $0 == 0 }
}

func reduceToString(numbers: [Int]) -> String {
    return numbers.reduce("Factors: ") {
        $0 + String($1) + " "
    }
}

generateNumber(max: 65)
calculateFactors(number: 100)

let result = reduceToString(numbers: calculateFactors(number: generateNumber(max: 100)))
let combined = generateNumber >>> calculateFactors >>> reduceToString
print(combined(100))
