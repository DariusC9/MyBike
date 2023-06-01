//
//  CarouselColorView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct CarouselColorView: View {
    @State var carouselItems: [CarouselColorItem]
    @State var spacing: CGFloat = 25
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(carouselItems, id: \.self) { item in
                    CarouselColorItemView(item: item)
                        .padding(.horizontal, spacing)
                }
            }
        }
    }
}

struct CarouselColorView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselColorView(carouselItems: [.defaultItem(), .defaultItem(),.defaultItem(),.defaultItem(),.defaultItem(),.defaultItem()])
    }
}
