//: Playground - noun: a place where people can play

let name = "twostraws"
let password = "fr0stie5"
let ip = "127.0.0.1"

let authentication = (name, password, ip)

switch authentication {
case (_, _, _):
    print("You could be literally anybody!")
case ("bilbo", "ba55ins", _):
    print("Hello, Bilbo Baggins!")
case ("twostraws", let password, _):
    print("Wow, your talk was awesome! \(password)")
default:
    print("Authentication failed")
}


func fizzbuzz(number: Int) -> String {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        return "FizzBuzz"
    default:
        return String(number)
    }
}

print(fizzbuzz(number: 1))
print(fizzbuzz(number: 2))
print(fizzbuzz(number: 3))
print(fizzbuzz(number: 4))
print(fizzbuzz(number: 5))
print(fizzbuzz(number: 6))
print(fizzbuzz(number: 15))
print(fizzbuzz(number: 16))

let twostraws = (name: "twostraws", password: "fr0stie5")
let bilbo = (name: "Bilbo", password: "ba55ins")
let taylor = (name: "Taylor", password: "swift")

let users = [twostraws, bilbo, taylor]

for case let (name, password) in users {
    print("User \(name) has the \(password) fr0stie5")
}

let optionalName: String? = "twostraws"
let optionalPassword: String? = "fr0stie5"

switch (optionalName, optionalPassword) {
case let (.some(name), password?): // both mean the same thing
    print(name, password)
default: break
}

let names: [Any?] = ["Bill", nil, "Ted", nil, 556]

for case let name? in names {
    print(name)
}

let range = 0...18
range ~= 5 // contains (0...18).contains(5)
