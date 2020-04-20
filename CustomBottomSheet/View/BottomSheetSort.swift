//
//  BottomSheetVC.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 21/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class BottomSheetSort: BottomSheetViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSortList()
    }

    fileprivate func setupUI() {
        viewHeight = 300
    }

    fileprivate func setupSortList() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SortCell", bundle: nil), forCellReuseIdentifier: "SortCell")
    }
}

extension BottomSheetSort: UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let switchView = UISwitch()

        cell.backgroundColor = .clear
        cell.textLabel?.text = "Item \(indexPath.row)"
        cell.accessoryView = switchView
        
        return cell
    }
}
