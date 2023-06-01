//
//  BikeViewModel.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import Foundation
import SwiftUI

extension BikeView {
    @MainActor class BikeViewModel: ObservableObject {
        @Published var allBikes = [BikeModel]()
    }
}
