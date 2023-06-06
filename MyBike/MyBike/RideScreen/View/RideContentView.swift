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
    
    @FetchRequest (entity: Ride.entity(), sortDescriptors: []) private var rides: FetchedResults<Ride>
    
    
    var body: some View {
        if rides.count == 0 {
            EmptyRideView()
        } else {
            RideView(allRides: convertToRideModel())
        }
    }
    
    private func convertToRideModel() -> [RideModel] {
        var allRides = [RideModel]()
        for ride in rides {
            // TODO: fetch bike name with bikeID

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
        
        let fetchRequest = NSFetchRequest<Bike>(entityName: "Bike")
        
        do {
            let results = try context.fetch(fetchRequest)
            for bike in results {
                if bike.id == id, let name = bike.name {
                    return name
                }
            }
        } catch {
            print("Error fetching Ride names: \(error.localizedDescription)")
        }
        return ""
    }
    
}

    

struct RideContentView_Previews: PreviewProvider {
    static var previews: some View {
        RideContentView()
    }
}
