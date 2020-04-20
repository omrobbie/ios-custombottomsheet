//
//  SortModel.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 21/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

enum SortType: Int {

    case name
    case type
    case availability
}

struct SortModel {

    let name: String
    let type: SortType
    var status: Bool
}
