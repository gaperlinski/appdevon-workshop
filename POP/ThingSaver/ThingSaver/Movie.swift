//
//  Movie.swift
//  ThingSaver
//
//  Created by Paul Hudson on 22/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import Foundation

class Movie: NSObject, NSCoding {
    var filename: String

    init(filename: String) {
        self.filename = filename
    }

    required init?(coder aDecoder: NSCoder) {
        filename = aDecoder.decodeObject(forKey: "filename") as! String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(filename, forKey: "filename")
    }
}
