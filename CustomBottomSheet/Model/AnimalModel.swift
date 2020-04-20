//
//  AnimalModel.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 21/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

enum AnimalType: String {

    case dog
    case cat
    case bird
    case fish
}

struct AnimalModel {

    let name: String
    let type: AnimalType
    let isAvailable: Bool
}

let dummyData: [AnimalModel] = [
    AnimalModel(name: "BullDog", type: .dog, isAvailable: true),
    AnimalModel(name: "Cat", type: .cat, isAvailable: true),
    AnimalModel(name: "Humming Bird", type: .bird, isAvailable: true),
    AnimalModel(name: "Canary", type: .bird, isAvailable: true),
    AnimalModel(name: "Lion", type: .cat, isAvailable: false),
    AnimalModel(name: "Penguin", type: .bird, isAvailable: false),
    AnimalModel(name: "Toucan", type: .bird, isAvailable: true),
    AnimalModel(name: "Bee", type: .bird, isAvailable: false),
    AnimalModel(name: "Shark", type: .fish, isAvailable: false),
    AnimalModel(name: "Chicken", type: .bird, isAvailable: true),
    AnimalModel(name: "Siberian Husky", type: .dog, isAvailable: true),
    AnimalModel(name: "Clown Fish", type: .fish, isAvailable: true),
    AnimalModel(name: "Macaw", type: .bird, isAvailable: true),
    AnimalModel(name: "Fox", type: .dog, isAvailable: false),
    AnimalModel(name: "Bat", type: .bird, isAvailable: true),
    AnimalModel(name: "Whale", type: .fish, isAvailable: false),
    AnimalModel(name: "Owl", type: .bird, isAvailable: true),
    AnimalModel(name: "Tiger", type: .cat, isAvailable: false),
    AnimalModel(name: "Pelican", type: .bird, isAvailable: false),
]
