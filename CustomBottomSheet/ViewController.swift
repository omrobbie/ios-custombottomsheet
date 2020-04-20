//
//  ViewController.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 20/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bottomSheetVC = BottomSheetViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomSheetVC.view.frame = view.frame
    }

    fileprivate func showBototmSheetView() {
        view.addSubview(bottomSheetVC.view)
    }

    @IBAction func btnOpenTapped(_ sender: Any) {
        showBototmSheetView()
    }
}
