//
//  RideModel.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import Foundation
import SwiftUI

struct RideModel: Hashable {
    
    let ID: UUID
    let title: String?
    let bikeName: String
    let distance: String
    let duration: String
    let Date: String
    
    static func testRide() -> RideModel {
        return RideModel(ID: UUID(),
                         title: "Friday 29 Ride",
                         bikeName: "Bike 3000",
                         distance: "60km",
                         duration: "2h, 14min",
                         Date: "29.03.2023")
    }
    
    // MARK: - Protocol Methods
    
    static func == (lhs: RideModel, rhs: RideModel) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ID)
    }
}
