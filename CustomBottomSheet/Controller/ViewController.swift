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
        setupBottomSheetSort()
        setupBottomSheetFilter()
        loadData()
    }

    fileprivate func setupBottomSheetSort() {
        bottomSheetSort.delegate = self
    }

    fileprivate func setupBottomSheetFilter() {
        bottomSheetFilter.delegate = self
    }

    fileprivate func loadData() {
        data = dummyData
    }

    @IBAction func btnSortTapped(_ sender: Any) {
        bottomSheetFilter.removeFromSuperview()
        bottomSheetSort.bringToFront(self)
    }

    @IBAction func btnFilterTapped(_ sender: Any) {
        bottomSheetSort.removeFromSuperview()
        bottomSheetFilter.bringToFront(self)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let item = data[indexPath.row]

        cell.imageView?.image = UIImage(named: item.imageName)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Animal Type: \(item.type.rawValue)"

        if item.isAvailable {
            cell.accessoryType = .checkmark
        }

        return cell
    }
}

extension ViewController: BottomSheetSortDelegate, BottomSheetFilterDelegate {

    func sortValueDidChanged(dataSort: [SortModel]) {
        dataSort.forEach { (item) in
            if item.status {
                switch item.type {
                case .name: data.sort(by: {$0.name < $1.name})
                case .type: data.sort(by: {$0.type.rawValue < $1.type.rawValue})
                case .availability: data.sort(by: {$0.isAvailable && !$1.isAvailable})
                }
            }
        }

        tableView.reloadData()
    }

    func filterValueDidChanged(nameSearch: String, types: [String], isAvailable: Bool) {
        data = dummyData

        if !nameSearch.isEmpty {
            data = data.filter({$0.name.lowercased().contains(nameSearch.lowercased())})
        }

        if types.count > 0 {
            data = data.filter({types.contains($0.type.rawValue)})
        }

        data = data.filter({$0.isAvailable == isAvailable})

        tableView.reloadData()
    }
}
