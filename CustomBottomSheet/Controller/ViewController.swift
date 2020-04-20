//
//  ViewController.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 20/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    fileprivate var data = [AnimalModel]()

    fileprivate var bottomSheetSort = BottomSheetSort()
    fileprivate var bottomSheetFilter = BottomSheetFilter()

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomSheetSort.view.frame = view.frame
        bottomSheetFilter.view.frame = view.frame
        data = dummyData
    }

    @IBAction func btnSortTapped(_ sender: Any) {
        view.addSubview(bottomSheetSort.view)
    }

    @IBAction func btnFilterTapped(_ sender: Any) {
        view.addSubview(bottomSheetFilter.view)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let item = data[indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Animal Type: \(item.type.rawValue)"

        if item.isAvailable {
            cell.accessoryType = .checkmark
        }

        return cell
    }
}
