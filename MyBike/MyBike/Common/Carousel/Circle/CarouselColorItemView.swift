//
//  CarouselColorView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import Foundation
import SwiftUI

struct CarouselColorItem: Hashable {
    
    let ID = UUID()
    let color: Color
    let name: String
    
    static func defaultItem() -> CarouselColorItem {
        return CarouselColorItem(color: .blue, name: "")
    }
    
    // MARK: - Protocol Methods
    
    static func == (lhs: CarouselColorItem, rhs: CarouselColorItem) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ID)
    }
    
}

