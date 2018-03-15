//
//  Coder.swift
//  ScrumTeam
//
//  Created by Paul Hudson on 24/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import Foundation

class Coder: TeamMember {
    private(set) var swiftSkill: Int

    init(name: String, favoriteTextEditor: TextEditor, swiftSkill: Int) {
        self.swiftSkill = min(max(swiftSkill, 0), 10)
        super.init(name: name, favoriteTextEditor: favoriteTextEditor)
    }

    func copyCodeFromStackOverflow() -> String {
        swiftSkill -= 1

        return "The spirit of Stack Overflow is coders helping coders"
    }

    override func wantsToAttendMeeting() -> Bool {
        return false
    }

    func getFormattedSwiftSkill() -> String {
        switch swiftSkill {
        case 0...3:
            return "Just learning"
        case 4...7:
            return "Experienced"
        case 8...9:
            return "Hardened veteran"
        default:
            return "Chris Lattner is my alter ego"
        }
    }
}
