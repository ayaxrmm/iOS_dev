//
//  models.swift
//  lab88
//
//  Created by Aya on 21.11.2025.
//

import Foundation
import UIKit

enum Category {
    case movie
    case music
    case book
    case course
}

struct FavoriteItem {
    let title: String
    let image: String
    let subtitle: String
    let review: String
    let category: Category
}
