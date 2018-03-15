//
//  PhotosViewController.swift
//  ThingSaver
//
//  Created by Paul Hudson on 22/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import QuickLook
import UIKit

class PhotosViewController: UICollectionViewController, QLPreviewControllerDataSource, ItemStoringProtocol, NavigationBarStylingProtocol {
    var items = [Photo]()
    var selectedItem: Photo?
    var savedKeyName = "SavedPhotos"
    let itemType = Photo.self
    var fileExtension = "jpg"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExampleData))

        navigationController?.navigationBar.isTranslucent = false
        setCustomTitle(str: "PHOTOS")
        loadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        let item = items[indexPath.item]

        if let imageView = cell.contentView.subviews.flatMap({ $0 as? UIImageView }).first {
            let url = Helper.getPathInDocumentsDirectory(item.filename)
            imageView.image = UIImage(contentsOfFile: url.path)
        }

        return cell
    }

    @objc func addExampleData() {
        do {
            try addItem()
            saveData()

            collectionView?.insertItems(at: [IndexPath(item: items.count - 1, section: 0)])
        } catch {
            print("Failed to create item: \(error.localizedDescription)")
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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

