//
//  main.swift
//  ScrumTeam
//
//  Created by Paul Hudson on 24/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import Foundation

let emacs = TextEditor(name: "Emacs")

let jessica = Coder(name: "Jessica", favoriteTextEditor: emacs, swiftSkill: 8)
let diego = Coder(name: "Diego", favoriteTextEditor: emacs, swiftSkill: 5)
let danielle = Coder(name: "Danielle", favoriteTextEditor: emacs, swiftSkill: 6)
let thomas = ProductOwner(name: "Thomas", favoriteTextEditor: emacs)
let scrumTeam = [jessica, diego, danielle, thomas]

func introduce(person: TeamMember) {
    print("Hello, my name is \(person.name)")
}

scrumTeam.forEach {
    introduce(person: $0)
}
