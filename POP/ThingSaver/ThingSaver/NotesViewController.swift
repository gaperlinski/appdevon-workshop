//
//  NotesViewController.swift
//  ThingSaver
//
//  Created by Paul Hudson on 22/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import QuickLook
import UIKit

class NotesViewController: UITableViewController, QLPreviewControllerDataSource {
    var items = [Note]()
    var selectedItem: Note?
    var savedKeyName = "SavedNotes"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExampleData))

        navigationController?.navigationBar.isTranslucent = false
        title = "NOTES"

        if let font = UIFont(name: "AvenirNext-Heavy", size: 30) {
            let attrs = [NSAttributedStringKey.font: font]
            navigationController?.navigationBar.titleTextAttributes = attrs
        }

        loadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = items[indexPath.item]
        let url = Helper.getPathInDocumentsDirectory(item.filename)

        if let string = try? String(contentsOfFile: url.path) {
            cell.textLabel?.text = string
        }

        return cell
    }

    func loadData() {
        let defaults = UserDefaults.standard

        if let savedData = defaults.object(forKey: savedKeyName) as? Data {
            if let savedItems = NSKeyedUnarchiver.unarchiveObject(with: savedData) as? [Note] {
                items = savedItems
            }
        }
    }

    func saveData() {
        let defaults = UserDefaults.standard
        let data = NSKeyedArchiver.archivedData(withRootObject: items)
        defaults.set(data, forKey: savedKeyName)
    }

    @objc func addExampleData() {
        guard let sourceURL = Bundle.main.url(forResource: "example", withExtension: "txt") else {
            fatalError("Unable to locate input file")
        }

        let filename = NSUUID().uuidString + ".txt"
        let destURL = Helper.getPathInDocumentsDirectory(filename)
        let fm = FileManager.default

        do {
            try fm.copyItem(at: sourceURL, to: destURL)
            let item = Note(filename: filename)
            items.append(item)
            saveData()

            tableView?.insertRows(at: [IndexPath(item: items.count - 1, section: 0)], with: .automatic)
        } catch {
            print("Failed to create item: \(error.localizedDescription)")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = items[indexPath.row]

        let previewController = PreviewViewController()
        previewController.dataSource = self

        let navController = UINavigationController(rootViewController: previewController)
        navController.modalPresentationStyle = .formSheet
        present(navController, animated: true)
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let selectedFile = selectedItem else { fatalError("Attempted to preview without selecting anything") }
        return Helper.getPathInDocumentsDirectory(selectedFile.filename) as QLPreviewItem
    }
}
