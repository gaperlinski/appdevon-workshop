//
//  MasterViewController.swift
//  ThingSaver
//
//  Created by Paul Hudson on 22/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, NavigationBarStylingProtocol {
    let types = ["Movies", "Notes", "Photos", "Songs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false
        setCustomTitle(str: "THINGSAVER")

        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        showDetailController(types[0])
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath)

        let type = types[indexPath.row]

        cell.textLabel?.text = type
        cell.imageView?.image = UIImage(named: type)

        let hue = CGFloat(indexPath.row) / 5
        cell.imageView?.tintColor = UIColor(hue: hue, saturation: 0.4, brightness: 1, alpha: 1)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = types[indexPath.row]
        showDetailController(type)
    }

    func showDetailController(_ type: String) {
        guard let nc = splitViewController?.viewControllers[1] as? UINavigationController else {
            return
        }

        guard nc.topViewController?.restorationIdentifier != type else {
            return
        }

        guard let vc = storyboard?.instantiateViewController(withIdentifier: type) else {
            return
        }

        nc.setViewControllers([vc], animated: true)
    }
}

