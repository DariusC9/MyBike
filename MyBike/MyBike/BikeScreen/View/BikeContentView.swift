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
            if let name = bike.name {
                allBikes.append(BikeModel(color: Color(bike.color ?? "bikeCornFlowerBlue"),
                                          name: name,
                                          distance: bike.distance,
                                          wheelSize: bike.wheelSize,
                                          bikeImages: BikeModel.BikeImages(topImageName: "bike_electric_over",
                                                                 middleImageName: "bike_electric_middle",
                                                                 wheelImageName: "bike_electric_small_wheels")))
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
