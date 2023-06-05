//
//  BikeModel.swift
//  MyBike
//
//  Created by Darius Couti on 30.05.2023.
//

import Foundation
import SwiftUI

struct BikeModel: Hashable {
    
    struct BikeImages {
        let topImageName: String
        let middleImageName: String
        let wheelImageName: String
    }
    
    let ID = UUID()
    let color: Color
    let name: String
    let distance: Double
    let wheelSize: Double
    let bikeImages: BikeImages
    
    static func testBike() -> BikeModel {
        return BikeModel(color: .white, name: "Test Bike", distance: 123, wheelSize: 18, bikeImages: BikeImages(topImageName: "bike_electric_over",
                                                                                                                                middleImageName: "bike_electric_middle",
                                                                                                                                wheelImageName: "bike_electric_small_wheels"))
    }
    
    // MARK: - Protocol Methods
    
    static func == (lhs: BikeModel, rhs: BikeModel) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ID)
    }
}
