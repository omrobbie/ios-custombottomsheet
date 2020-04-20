//
//  BottomSheetVC.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 21/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

protocol BottomSheetSortDelegate {

    func sortValueDidChanged(dataSort: [SortModel])
}

class BottomSheetSort: BottomSheetViewController {

    @IBOutlet weak var tableView: UITableView!

    var delegate: BottomSheetSortDelegate?

    fileprivate var dataSort: [SortModel] = [
        SortModel(name: "Name", type: .name, status: false),
        SortModel(name: "Type", type: .type, status: false),
        SortModel(name: "Availability", type: .availability, status: false),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSortList()
    }

    fileprivate func setupUI() {
        viewHeight = 250
    }

    fileprivate func setupSortList() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SortCell", bundle: nil), forCellReuseIdentifier: "SortCell")
    }
}

extension BottomSheetSort: UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSort.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = dataSort[indexPath.row]

        let switchView = UISwitch()
        switchView.tag = item.type.rawValue
        switchView.isOn = item.status
        switchView.addTarget(self, action: #selector(sortChanged(_:)), for: .valueChanged)

        cell.backgroundColor = .clear
        cell.textLabel?.text = item.name
        cell.accessoryView = switchView
        
        return cell
    }

    @objc func sortChanged(_ sender: UISwitch) {
        dataSort[sender.tag].status.toggle()
        delegate?.sortValueDidChanged(dataSort: dataSort)
    }
}
