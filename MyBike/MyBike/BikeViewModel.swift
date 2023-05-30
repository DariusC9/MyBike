//
//  BikeViewModel.swift
//  MyBike
//
//  Created by Darius Couti on 30.05.2023.
//

import Foundation
import SwiftUI

struct BikeViewModel {
    struct BikeImages {
        let topImageName: String
        let middleImageName: String
        let wheelImageName: String
    }
    
    let ID: Int
    let color: Color
    let name: String
    let distance: Int
    let wheelSize: Double
    let bikeImages: BikeImages
    
    static func empty() -> BikeViewModel {
        return BikeViewModel(ID: 123456, color: .white, name: "Test Bike", distance: 123, wheelSize: 18, bikeImages: BikeImages(topImageName: "bike_electric_over",
                                                                                                                                middleImageName: "bike_electric_middle",
                                                                                                                                wheelImageName: "bike_electric_small_wheels"))
    }
}
