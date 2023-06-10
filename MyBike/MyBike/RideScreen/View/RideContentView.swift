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
    
    var body: some View {
        VStack {
            if rides.count == 0 {
                EmptyRideView()
            } else {
                RideView()
            }
        }
    }
}

struct RideContentView_Previews: PreviewProvider {
    static var previews: some View {
        RideContentView()
    }
}
