//
//  ViewController.swift
//  Codable
//
//  Created by Paul Hudson on 23/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import Cocoa

struct Entry: Decodable {
    
    struct Commit: Decodable {
        struct Author: Decodable {
            var name: String
            var email: String
            var date: String
        }
        var author: Author
    }
    
    var url: URL
    var htmlURL: URL
    var commit: Commit
    
    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case commit
    }
}

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadJSON()
    }

    func loadJSON() {
        guard let url = Bundle.main.url(forResource: "commits", withExtension: "json") else {
            fatalError("Unable to find JSON in project")
        }
        do {
            let decoder = JSONDecoder()
            let contents = try Data(contentsOf: url)
            let decoded = try decoder.decode([Entry].self, from: contents)
            print(decoded[0].commit.author.email)
        } catch {
            print("Unable to parse JSON: \(error.localizedDescription)")
        }
    }
}

