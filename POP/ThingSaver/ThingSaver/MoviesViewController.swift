//
//  MoviesViewController.swift
//  ThingSaver
//
//  Created by Paul Hudson on 22/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import QuickLook
import UIKit

class MoviesViewController: UICollectionViewController, QLPreviewControllerDataSource {
    var items = [Movie]()
    var selectedItem: Movie?
    var savedKeyName = "SavedMovies"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExampleData))

        navigationController?.navigationBar.isTranslucent = false
        title = "MOVIES"

        if let font = UIFont(name: "AvenirNext-Heavy", size: 30) {
            let attrs = [NSAttributedStringKey.font: font]
            navigationController?.navigationBar.titleTextAttributes = attrs
        }

        loadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        return cell
    }

    func loadData() {
        let defaults = UserDefaults.standard

        if let savedData = defaults.object(forKey: savedKeyName) as? Data {
            if let savedItems = NSKeyedUnarchiver.unarchiveObject(with: savedData) as? [Movie] {
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
        guard let sourceURL = Bundle.main.url(forResource: "example", withExtension: "mp4") else {
            fatalError("Unable to locate input file")
        }

        let filename = NSUUID().uuidString + ".mp4"
        let destURL = Helper.getPathInDocumentsDirectory(filename)
        let fm = FileManager.default

        do {
            try fm.copyItem(at: sourceURL, to: destURL)
            let item = Movie(filename: filename)
            items.append(item)
            saveData()

            collectionView?.insertItems(at: [IndexPath(item: items.count - 1, section: 0)])
        } catch {
            print("Failed to create item: \(error.localizedDescription)")
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
