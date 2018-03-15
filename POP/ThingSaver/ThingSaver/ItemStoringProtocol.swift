//
//  ItemStoringProtocol.swift
//  ThingSaver
//
//  Created by Grzegorz Aperlinski on 15/03/2018.
//  Copyright © 2018 Paul Hudson. All rights reserved.
//

import QuickLook
import UIKit

protocol ItemStoringProtocol: AnyObject {
    associatedtype itemType: ItemProtocol

    var items: [itemType] { get set }
    var selectedItem: itemType? { get set }
    var savedKeyName: String { get set }
    var fileExtension: String { get set }

    func loadData()
    func saveData()
    func addItem() throws
    func selectItem(_ item: Int)
}

extension ItemStoringProtocol {
    func loadData() {
        let defaults = UserDefaults.standard
        let decoder = JSONDecoder()
        
        if let savedData = defaults.object(forKey: savedKeyName) as? Data {
            if let savedItems = try? decoder.decode([itemType].self, from: savedData) {
                items = savedItems
            }
        }
    }
    
    func saveData() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(items) {
            defaults.set(data, forKey: savedKeyName)
        } else {
            fatalError("Couldn't prepare items for saving")
        }
    }
    
    func addItem() throws {
        guard let sourceURL = Bundle.main.url(forResource: "example", withExtension: fileExtension) else {
            fatalError("Unable to locate input file")
        }
        
        let filename = NSUUID().uuidString + ".\(fileExtension)"
        let destURL = Helper.getPathInDocumentsDirectory(filename)
        let fm = FileManager.default
        
        try fm.copyItem(at: sourceURL, to: destURL)
        let item = itemType(filename: filename)
        items.append(item)
        saveData()
    }
}

extension ItemStoringProtocol where Self: UIViewController, Self: QLPreviewControllerDataSource {
    
    func selectItem(_ item: Int) {
        selectedItem = items[item]
        
        let previewController = PreviewViewController()
        previewController.dataSource = self
        
        let navController = UINavigationController(rootViewController: previewController)
        navController.modalPresentationStyle = .formSheet
        present(navController, animated: true)
    }
}
