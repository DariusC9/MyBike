//
//  CarouselBiveView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct CarouselBiveView: View {
    @State var carouselItems: [CarouselBikeItem]
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
        CarouselBiveView(carouselItems: [.defaultItem(), .defaultItem(), .defaultItem(), .defaultItem()])
    }
}
