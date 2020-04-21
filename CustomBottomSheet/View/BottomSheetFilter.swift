//
//  BottomSheetFilter.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 21/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class BottomSheetFilter: BottomSheetViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var switchView: UISwitch!

    fileprivate var type = [AnimalType]()
    fileprivate var typeSelected = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNameSearch()
        setupTypeList()
        loadData()
    }

    fileprivate func setupUI() {
        viewHeight = 370
    }

    fileprivate func setupNameSearch() {
        searchBar.delegate = self
    }

    fileprivate func setupTypeList() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FilterCell", bundle: nil), forCellWithReuseIdentifier: "FilterCell")
    }

    fileprivate func loadData() {
        type = AnimalType.allCases
    }

    @IBAction func switchViewTapped(_ sender: Any) {
        print(switchView.isOn)
    }
}

extension BottomSheetFilter: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()

        if let searchText = searchBar.text {
            print(searchText)
        }
    }
}

extension BottomSheetFilter: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = type[indexPath.row]
        let width: CGFloat = (10 * CGFloat(item.rawValue.count)) + 50
        return CGSize(width: width, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return type.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCell
        let item = type[indexPath.row]
        cell.lblFilter.text = item.rawValue
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionView.cellForItem(at: indexPath) as! FilterCell
        let item = type[indexPath.row]

        if cell.view.backgroundColor?.cgColor == UIColor.systemBlue.cgColor {
            cell.view.backgroundColor = .systemBackground
            typeSelected.removeAll(where: {$0 == item.rawValue})
        } else {
            cell.view.backgroundColor = .systemBlue
            typeSelected.append(item.rawValue)
        }
        
        print(typeSelected)
    }
}
