//
//  CarouselBikeItemView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

enum BikeType: String {
    case roadBike = "roadbike"
    case hybrid
    case electric
    case mtb
    
    func getName() -> String {
        switch self {
        case .roadBike:
            return "Road Bike"
        case .hybrid:
            return "Hybrid Bike"
        case .electric:
            return "Electric Bike"
        case .mtb:
            return "Mtb Bike"
        }
    }
    
    func getTopImageName() -> String {
        return "bike_\(self.rawValue)_big_wheels"
    }
    
    func getMiddleImageName() -> String {
        return "bike_\(self.rawValue)_middle"
    }
    
    func getBottomImageName() -> String {
        return "bike_\(self.rawValue)_over"
    }
}

struct CarouselBikeItem: Hashable {
    let ID = UUID()
    let bikeType: BikeType
    var isSelected: Bool = false
    var actionWhenSelected: ((CarouselColorItem) -> Void)?
    
    static func defaultItem() -> CarouselBikeItem {
        return CarouselBikeItem(bikeType: .electric,
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
    
    var body: some View {
        VStack {
            ZStack{
                Image(item.bikeType.getTopImageName())
                Image(item.bikeType.getMiddleImageName())
                    .colorMultiply(color)
                Image(item.bikeType.getBottomImageName())
            }
            Text(item.bikeType.getName())
        }
    }
}

struct CarouselBikeItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselBikeItemView(item: CarouselBikeItem(bikeType: .mtb))
    }
}
