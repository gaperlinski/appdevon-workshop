//
//  SongsViewController.swift
//  ThingSaver
//
//  Created by Paul Hudson on 22/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import QuickLook
import UIKit

class SongsViewController: UITableViewController, QLPreviewControllerDataSource, ItemStoringProtocol, NavigationBarStylingProtocol {
    
    var items = [Song]()
    var selectedItem: Song?
    var savedKeyName = "SavedSongs"
    let itemType = Song.self
    var fileExtension = "mp3"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExampleData))

        navigationController?.navigationBar.isTranslucent = false
        setCustomTitle(str: "SONGS")
        loadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Play song"
        return cell
    }

    @objc func addExampleData() {
        do {
            try addItem()
            saveData()

            tableView?.insertRows(at: [IndexPath(item: items.count - 1, section: 0)], with: .automatic)
        } catch {
            print("Failed to create item: \(error.localizedDescription)")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectItem(indexPath.row)
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let selectedFile = selectedItem else { fatalError("Attempted to preview without selecting anything") }
        return Helper.getPathInDocumentsDirectory(selectedFile.filename) as QLPreviewItem
    }
}

