//
//  TeamMember.swift
//  ScrumTeam
//
//  Created by Paul Hudson on 24/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import Foundation

class TeamMember {
    var name: String
    var favoriteTextEditor: TextEditor

    init(name: String, favoriteTextEditor: TextEditor) {
        self.name = name
        self.favoriteTextEditor = favoriteTextEditor
    }

    func wantsToAttendMeeting() -> Bool {
        return true
    }
}
