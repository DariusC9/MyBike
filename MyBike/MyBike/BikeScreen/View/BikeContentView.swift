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
                BikeView()
            }
        }
    }

}

struct BikeContentView_Previews: PreviewProvider {
    static var previews: some View {
        BikeContentView()
    }
}
