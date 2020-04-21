//
//  AnimalModel.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 21/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

enum AnimalType: String, CaseIterable {

    case dog
    case cat
    case bird
    case fish
    case horse
    case snake
    case bear
}

struct AnimalModel {

    let name: String
    let type: AnimalType
    let isAvailable: Bool
    let imageName: String
}

let dummyData: [AnimalModel] = [
    AnimalModel(name: "BullDog", type: .dog, isAvailable: true, imageName: "bulldog"),
    AnimalModel(name: "Cat", type: .cat, isAvailable: true, imageName: "cat"),
    AnimalModel(name: "Humming Bird", type: .bird, isAvailable: true, imageName: "humming_bird"),
    AnimalModel(name: "Canary", type: .bird, isAvailable: true, imageName: "canary"),
    AnimalModel(name: "Lion", type: .cat, isAvailable: false, imageName: "lion"),
    AnimalModel(name: "Penguin", type: .bird, isAvailable: false, imageName: "penguin"),
    AnimalModel(name: "Toucan", type: .bird, isAvailable: true, imageName: "toucan"),
    AnimalModel(name: "Bee", type: .bird, isAvailable: false, imageName: "bee"),
    AnimalModel(name: "Shark", type: .fish, isAvailable: false, imageName: "shark"),
    AnimalModel(name: "Chicken", type: .bird, isAvailable: true, imageName: "chicken"),
    AnimalModel(name: "Siberian Husky", type: .dog, isAvailable: true, imageName: "siberian_husky"),
    AnimalModel(name: "Clown Fish", type: .fish, isAvailable: true, imageName: "clown_fish"),
    AnimalModel(name: "Macaw", type: .bird, isAvailable: true, imageName: "macaw"),
    AnimalModel(name: "Fox", type: .dog, isAvailable: false, imageName: "fox"),
    AnimalModel(name: "Bat", type: .bird, isAvailable: true, imageName: "bat"),
    AnimalModel(name: "Whale", type: .fish, isAvailable: false, imageName: "whale"),
    AnimalModel(name: "Owl", type: .bird, isAvailable: true, imageName: "owl"),
    AnimalModel(name: "Tiger", type: .cat, isAvailable: false, imageName: "tiger"),
    AnimalModel(name: "Pelican", type: .bird, isAvailable: false, imageName: "pelican"),
]
