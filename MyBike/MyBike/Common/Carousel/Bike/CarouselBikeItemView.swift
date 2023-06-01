//
//  CarouselBikeItemView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct CarouselBikeItem: Hashable {
    let ID = UUID()
    let bikeType: String
    var color: Color
    var isSelected: Bool = false
    var actionWhenSelected: ((CarouselColorItem) -> Void)?
    
    static func defaultItem() -> CarouselBikeItem {
        return CarouselBikeItem(bikeType: "Road Bike",
                                color: .blue,
                                isSelected: false,
                                actionWhenSelected: { item in
            print("Pushed \(item)")
        })
        
        
        }
    
    
    // MARK: - Protocol Methods
    
    static func == (lhs: CarouselBikeItem, rhs: CarouselBikeItem) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ID)
    }
}





struct CarouselBikeItemView: View {
    @State var item: CarouselBikeItem
    @State var color: Color = .blue
    @State var type: String = "Road Bike"
    
    var body: some View {
        VStack {
            ZStack{
                Image("bike_electric_big_wheels")
                Image("bike_electric_middle")
                    .colorMultiply(item.color)
                Image("bike_electric_over")
            }
            Text(item.bikeType)
        }
    }
}

struct CarouselBikeItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselBikeItemView(item: CarouselBikeItem.defaultItem())
    }
}
