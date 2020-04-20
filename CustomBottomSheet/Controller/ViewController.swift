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

    var bottomSheetSort = BottomSheetSort()
    var bottomSheetFilter = BottomSheetFilter()

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomSheetSort.view.frame = view.frame
        bottomSheetFilter.view.frame = view.frame
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
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Item \(indexPath.row)"
        return cell
    }
}
