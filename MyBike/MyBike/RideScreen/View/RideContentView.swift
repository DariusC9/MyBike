//
//  RideContentView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI
import CoreData

struct RideContentView: View {
    @Environment(\.managedObjectContext) private var context: NSManagedObjectContext
    
    @FetchRequest(entity: Ride.entity(), sortDescriptors: []) private var rides: FetchedResults<Ride>
    
    @State private var bikes = PersistenceController.shared.fetchBikes()
    
    @State private var statistics: [StatisticsData] = []
    
    var body: some View {
        VStack {
            if rides.count == 0 {
                EmptyRideView()
            } else {
                RideView(allRides: convertToRideModel(), allStatistics: statistics)
                    .onAppear(perform: {
                        statistics = transformDataIntoStatistics()
                    })
            }
        }
    }
    
    private func transformDataIntoStatistics() -> [StatisticsData] {
        var data: [StatisticsData] = []
        for bike in bikes {
            if let id = bike.id,
               let name = bike.name,
               let color = bike.color {
                let bikeTotalDistance = calculateBikeTotalDistance(id)
                data.append(StatisticsData(color: color,
                                           value: bikeTotalDistance,
                                           bikeName: name,
                                           bikeID: id))

            }
        }
        return data
    }
    
    private func calculateBikeTotalDistance(_ id: UUID) -> Int {
        var count = 0
        for ride in rides {
            if ride.bikeId == id {
                count += Int(ride.distance)
            }
        }
        return count
    }
    
    private func convertToRideModel() -> [RideModel] {
        var allRides = [RideModel]()
        for ride in rides {
            // TODO: fetch bike name with bikeID

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
    private func fetchBikeName(_ id: UUID) -> String {
            for bike in bikes {
                if bike.id == id, let name = bike.name {
                    return name
                }
            }
        return ""
    }
    
}

    

struct RideContentView_Previews: PreviewProvider {
    static var previews: some View {
        RideContentView()
    }
}
