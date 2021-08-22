//
//  Model.swift
//  CollectionViewPhotos
//
//  Created by Маша on 22.08.2021.
//

import Foundation
import UIKit

struct Section {
    let type: String
    let title: String
    let items: [ModelItem]
}

struct ModelItem {
    let title: String
    let number: String
    let nameImage: String
}
