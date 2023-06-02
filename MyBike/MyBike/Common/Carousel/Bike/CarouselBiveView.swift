//
//  CarouselBiveView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct CarouselBiveView: View {
    
    var carouselItems: [CarouselBikeItem] = [
        CarouselBikeItem(bikeType: .roadBike),
        CarouselBikeItem(bikeType: .hybrid),
        CarouselBikeItem(bikeType: .electric),
        CarouselBikeItem(bikeType: .mtb)
    ]
    
    @State var spacing: CGFloat = 25
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(carouselItems, id: \.self) { item in
                    CarouselBikeItemView(item: item)
                        .padding(.horizontal, spacing)
                }
            }
        }
    }
}

struct CarouselBiveView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselBiveView()
    }
}
