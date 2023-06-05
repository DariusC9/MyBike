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
    @State var selectedColor: CarouselColorItem?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(carouselItems, id: \.self) { item in
                    createColorView(item)
                        .padding(.horizontal, spacing)
                }
            }
        }
    }
    
    // MARK: - Color Helpers
    
    @ViewBuilder
    func createColorView(_ item: CarouselColorItem) -> some View {
        VStack {
            Circle()
                .foregroundColor(item.color)
                .border(isSelected(item) ? .white : .clear, width: 2)
                .frame(maxWidth: 20, maxHeight: 20)
        }.gesture(
            TapGesture()
                .onEnded { _ in
                    selectedColor = item
                }
        )
    }
    
    private func isSelected(_ item: CarouselColorItem) -> Bool {
        guard let selectedColor = self.selectedColor else {
            return false
        }
        return selectedColor == item
    }
}

struct CarouselColorView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselColorView()
    }
}
