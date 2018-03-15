//: Playground - noun: a place where people can play

import UIKit

protocol Student {
    func applaudAwesomeHudsonTalk()
}

extension Student {
    func applaudAwesomeHudsonTalk() {
        print("Yes, that was indeed the finest talk ever.")
    }
}

struct Greg: Student {
    func applaudAwesomeHudsonTalk() {
        print("It was better than the best!")
    }
}

let allGregs: [Student] = [Greg(), Greg()]

for greg in allGregs {
    greg.applaudAwesomeHudsonTalk()
}
