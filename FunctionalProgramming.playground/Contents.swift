//: Playground - noun: a place where people can play


enum Weather {
    case cloudy(coverage: Int)
    case sunny
}

let today = Weather.cloudy(coverage: 100)

switch today {
case .cloudy(let coverage) where coverage < 100:
    print(1)
case .cloudy:
    print(2)
default:
    print(3)
}

let forecast: [Weather] = [.sunny, .cloudy(coverage: 70), .sunny]

for case let .cloudy(coverage) in forecast {
    print("It's cloudy with \(coverage)% coverage")
}

let view: Any = UIButton()

switch view {
case is UIButton:
    print("Found a button")
case is UIView:
    print("Found a view")
default:
    print("Something else")
}
