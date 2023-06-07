//
//  Transformer.swift
//  MyBike
//
//  Created by Darius Couti on 07.06.2023.
//

import Foundation
import SwiftUI

class Transformer {
    
    static let shared = Transformer()
    
    private var bikes: [Bike] = PersistenceController.shared.fetchBikes()
    private var rides: [Ride] = PersistenceController.shared.fetchRides()
    
    
    func convertToRideModel(from rides: [Ride]) -> [RideModel] {
        var allRides = [RideModel]()
        for ride in rides {
            if let id = ride.id,
               let duration = ride.duration,
               let date = ride.date,
               let bikeID = ride.bikeId {
               let bikeName = fetchBikeName(bikeID)
                allRides.append(RideModel(ID: id,
                                          title: ride.title,
                                          bikeName: bikeName,
                                          distance: String(ride.distance),
                                          duration: duration,
                                          Date: date))
            }
        }
        return allRides
    }
    
    private func fetchBikeName(_ id: UUID) -> String {
            for bike in bikes {
                if bike.id == id, let name = bike.name {
                    return name
                }
            }
        return ""
    }
}
