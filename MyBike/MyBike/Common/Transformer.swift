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
               let bikeID = ride.bikeId,
               let title = ride.title {
               let bikeName = fetchBikeName(bikeID)
                allRides.append(RideModel(ID: id,
                                          title: title,
                                          bikeName: bikeName,
                                          distance: String(ride.distance),
                                          duration: duration,
                                          Date: date))
            }
        }
        return allRides
    }
    
     func fetchBikeName(_ id: UUID) -> String {
            for bike in bikes {
                if bike.id == id, let name = bike.name {
                    return name
                }
            }
        return ""
    }
    
    func fetchRideName(_ id: UUID) -> String {
        for ride in rides {
            if ride.id == id, let name = ride.title {
                return name
            }
        }
    return ""
}

    func fetchBike(from id: UUID) -> Bike? {
        for bike in bikes {
            if bike.id == id {
                return bike
            }
        }
        return nil
    }
    
    func fetchRide(from id: UUID) -> Ride? {
        for ride in rides {
            if ride.id == id {
                return ride
            }
        }
        return nil
    }
    
    func defaultBikeBool(from item: BikeModel, _ bikes: [Bike]) -> Bool {
        let name = item.name
        for bike in bikes {
            if bike.name == name {
                return bike.defaultBike
            }
        }
        return false
    }
}
