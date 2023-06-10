//
//  BikeContentView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI
import CoreData

struct BikeContentView: View {
    @Environment(\.managedObjectContext) private var context: NSManagedObjectContext
    
    @FetchRequest (entity: Bike.entity(), sortDescriptors: []) private var bikes: FetchedResults<Bike>

    var body: some View {
        VStack {
            if bikes.count == 0 {
                EmptyBikeView()
            } else {
                BikeView(bikeList: convertToBikeModel())
            }
        }
    }
    
    private func convertToBikeModel() -> [BikeModel] {
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
    
}

struct BikeContentView_Previews: PreviewProvider {
    static var previews: some View {
        BikeContentView()
    }
}
