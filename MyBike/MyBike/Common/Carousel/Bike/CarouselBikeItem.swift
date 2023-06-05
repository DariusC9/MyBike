//
//  CarouselBikeItemView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

enum BikeType: String {
    case roadBike = "roadbike"
    case hybrid
    case electric
    case mtb
    
    func getName() -> String {
        switch self {
        case .roadBike:
            return "Road Bike"
        case .hybrid:
            return "Hybrid Bike"
        case .electric:
            return "Electric Bike"
        case .mtb:
            return "Mtb Bike"
        }
    }
    
    func getTag() -> Int {
        switch self {
        case .roadBike:
            return 0
        case .hybrid:
            return 1
        case .electric:
            return 2
        case .mtb:
            return 3
        }
    }
    
    func getTopImageName() -> String {
        return "bike_\(self.rawValue)_big_wheels"
    }
    
    func getMiddleImageName() -> String {
        return "bike_\(self.rawValue)_middle"
    }
    
    func getBottomImageName() -> String {
        return "bike_\(self.rawValue)_over"
    }
}

struct CarouselBikeItem: Hashable {
    let ID = UUID()
    let bikeType: BikeType
    var isSelected: Bool = false
    var actionWhenSelected: ((CarouselColorItem) -> Void)?
    
    static func defaultItem() -> CarouselBikeItem {
        return CarouselBikeItem(bikeType: .electric,
                                isSelected: false,
                                actionWhenSelected: { item in
            print("Pushed \(item)")
        })
        
        
        }
    
    
    // MARK: - Protocol Methods
    
    static func == (lhs: CarouselBikeItem, rhs: CarouselBikeItem) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ID)
    }
}
