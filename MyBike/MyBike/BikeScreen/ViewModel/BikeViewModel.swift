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
    
    @Published var rides: [Ride]
    @Published var bikeModels: [BikeModel]
    
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
        self.bikeModels = Helper.shared.convertToBikeModels(PersistenceController.shared.fetchBikes())
        objectWillChange.send()
    }
}

