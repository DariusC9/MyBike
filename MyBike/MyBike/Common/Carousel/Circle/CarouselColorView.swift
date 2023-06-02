//
//  CarouselColorView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct CarouselColorView: View {
    var carouselItems: [CarouselColorItem] = [
        CarouselConstants.white,
        CarouselConstants.gray,
        CarouselConstants.green,
        CarouselConstants.red,
        CarouselConstants.yellow,
        CarouselConstants.blue,
        CarouselConstants.orange,
        CarouselConstants.teal,
        CarouselConstants.beige,
        CarouselConstants.pink,
        CarouselConstants.ciment,
        CarouselConstants.brown,
    ]
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
        CarouselColorView()
    }
}
