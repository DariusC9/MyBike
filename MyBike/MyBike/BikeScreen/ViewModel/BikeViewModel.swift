//
//  BikeViewModel.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import Foundation
import SwiftUI
import CoreData

class BikeViewModel: ObservableObject {
    @Environment(\.managedObjectContext) private var context: NSManagedObjectContext
    @FetchRequest(entity: Bike.entity(), sortDescriptors: []) private var bikes: FetchedResults<Bike>
    
    @Published var rides: [Ride]
    
    @State var bikeModels: [BikeModel]
    
    init() {
        let allBikes = PersistenceController.shared.fetchBikes()
        self.rides = PersistenceController.shared.fetchRides()
        self.bikeModels = Helper.shared.convertToBikeModels(allBikes)
    }
    
    func updateItems() {
        self.rides = PersistenceController.shared.fetchRides()
        updateBikeModels()
    }
    
    private func updateBikeModels() {
        bikeModels = Helper.shared.convertToBikeModels(bikes.reversed())
    }
}

