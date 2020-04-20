//
//  ViewController.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 20/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
