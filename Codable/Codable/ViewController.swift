//
//  ViewController.swift
//  Codable
//
//  Created by Paul Hudson on 23/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import Cocoa

struct Entry: Decodable {
    
    var url: URL
    var htmlURL: URL
    var name: String
    var email: String
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case commit
    }
    
    enum CommitCodingKeys: String, CodingKey {
        case author
    }
    
    enum AuthorCodingKeys: String, CodingKey {
        case name, email, date
    }
    
    init(form decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decode(URL.self, forKey: .url)
        htmlURL = try container.decode(URL.self, forKey: .htmlURL)
        
        let commit = try container.nestedContainer(keyedBy: CommitCodingKeys.self, forKey: .commit)
        let author = try commit.nestedContainer(keyedBy: AuthorCodingKeys.self, forKey: .author)
        
        name = try author.decode(String.self, forKey: .name)
        email = try author.decode(String.self, forKey: .email)
        date = try author.decode(Date.self, forKey: .date)
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
            decoder.dateDecodingStrategy = .iso8601 // Standard date format
            let contents = try Data(contentsOf: url)
            let decoded = try decoder.decode([Entry].self, from: contents)
            print(decoded[0].date)
        } catch {
            print("Unable to parse JSON: \(error.localizedDescription)")
        }
    }
}

