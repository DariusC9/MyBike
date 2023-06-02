//
//  RideModel.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import Foundation
import SwiftUI

struct RideModel: Hashable {
    
    let ID = UUID()
    let name: String
    let bikeName: String
    let distance: String
    let duration: String
    let Date: String
    
    static func testRide() -> RideModel {
        return RideModel(name: "Friday 29 Ride",
                         bikeName: "Nukeproof Scout 290",
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
