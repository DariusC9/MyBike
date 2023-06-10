//
//  Helper.swift
//  MyBike
//
//  Created by Darius Couti on 07.06.2023.
//

import Foundation
import SwiftUI

struct Helper {
    
    static let shared = Helper()
    
    func hasBikes() -> Bool {
        return PersistenceController.shared.fetchBikes().count > 0
    }
    
    func hasRides() -> Bool {
        return PersistenceController.shared.fetchRides().count > 0
    }
    
    func convertToBikeModel(_ bikes: [Bike]) -> [BikeModel] {
        var allBikes = [BikeModel]()
        for bike in bikes {
            if let name = bike.name,
               let id = bike.id {
                let colorName = bike.color ?? "bikeCornFlowerBlue"
                allBikes.append(BikeModel(ID: id,
                                          color: colorName,
                                          name: name,
                                          distance: Double(bike.distance),
                                          wheelSize: Double(bike.wheelSize),
                                          bikeImages: BikeModel.BikeImages(topImageName: "bike_\(bike.type ?? "electric")_over",
                                                                 middleImageName: "bike_\(bike.type ?? "electric")_middle",
                                                                 wheelImageName: "bike_\(bike.type ?? "electric")_small_wheels")))
            }
        }
        return allBikes
    }

    func convertToRideModel(from rides: [Ride], using bikeID: UUID) -> [RideModel] {
        let bike = getBike(from: bikeID)
        return convertToRideModel(rides.filter({ $0.bikeRelationship == bike }))
    }
    
    func convertToRideModel(_ rides: [Ride]) -> [RideModel] {
        var allRides = [RideModel]()
        for ride in rides {
            if let id = ride.id,
               let duration = ride.duration,
               let date = ride.date,
               let bikeID = ride.bikeId,
               let title = ride.title,
               let bikeName = getBike(from: bikeID)?.name {
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

    func getBike(from id: UUID) -> Bike? {
        let bikes = PersistenceController.shared.fetchBikes()
        for bike in bikes {
            if bike.id == id {
                return bike
            }
        }
        return nil
    }
    
    func getRide(from id: UUID) -> Ride? {
        let rides = PersistenceController.shared.fetchRides()
        for ride in rides {
            if ride.id == id {
                return ride
            }
        }
        return nil
    }
    
    func isDefaultBike(_ item: BikeModel) -> Bool {
        let bikes = PersistenceController.shared.fetchBikes()
        let id = item.ID
        for bike in bikes {
            if bike.id == id, bike.defaultBike {
                return true
            }
        }
        return false
    }
    
    func transformDataIntoStatistics(_ bikes: [Bike]) -> [StatisticsData] {
        var data: [StatisticsData] = []
        for bike in bikes {
            if let id = bike.id,
               let name = bike.name,
               let color = bike.color {
                let bikeTotalDistance = calculateBikeTotalDistance(id)
                if bikeTotalDistance > 0 {
                    data.append(StatisticsData(color: color,
                                               value: bikeTotalDistance,
                                               bikeName: name,
                                               bikeID: id))
                }
            }
        }
        return data
    }
    
    private func calculateBikeTotalDistance(_ id: UUID) -> Int {
        var count = 0
        let rides = PersistenceController.shared.fetchBikesRides(for: id)
        for ride in rides {
            if ride.bikeId == id {
                count += Int(ride.distance)
            }
        }
        return count
    }
}
