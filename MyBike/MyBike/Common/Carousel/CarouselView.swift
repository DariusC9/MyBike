//
//  CarouselView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct CarouselView: View {
    var carouselColorItems: [CarouselColorItem] = [
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
    
    var carouselBikeItems: [CarouselBikeItem] = [
        CarouselBikeItem(bikeType: .roadBike),
        CarouselBikeItem(bikeType: .hybrid),
        CarouselBikeItem(bikeType: .electric),
        CarouselBikeItem(bikeType: .mtb)
    ]
    
    @State var spacing: CGFloat = 25
    @State var selectedColor: CarouselColorItem?
    @State var selectedImageIndex = 0
    private let imageSize: CGSize = CGSize(width: 180, height: 180)
    
    @Binding var color: String
    @Binding var bikeType: BikeType
    
    var body: some View {
        VStack(spacing: 30) {
            createColorCarousel()
            createBikeCarousel()
        }
    }
    
    // MARK: - Color Helpers
    
    @ViewBuilder
    private func createColorCarousel() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(carouselColorItems, id: \.self) { item in
                    createColorView(item)
                        .padding(.horizontal, spacing)
                }
            }
        }
    }
    
    @ViewBuilder
    private func createColorView(_ item: CarouselColorItem) -> some View {
        VStack {
            Circle()
                .foregroundColor(item.color)
                .border(isSelected(item) ? .white : .clear, width: 2)
                .frame(maxWidth: 20, maxHeight: 20)
        }.gesture(
            TapGesture()
                .onEnded { _ in
                    selectedColor = item
                    color = item.name
                }
        )
    }
    
    private func isSelected(_ item: CarouselColorItem) -> Bool {
        guard let selectedColor = self.selectedColor else {
            return false
        }
        return selectedColor == item
    }
    
    // MARK: - Bike Carousel
    
    @ViewBuilder
    private func createBikeCarousel() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 100) {
                ForEach(carouselBikeItems, id: \.self) { item in
                    createBikeView(item)
                        .padding()
                        .tag(item.bikeType.getTag())
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .padding(.horizontal, 16)
            .frame(height: 200)
        }
        HStack(spacing: 8) {
            ForEach(carouselBikeItems, id: \.self) { item in
                Circle()
                    .foregroundColor(item.bikeType.getTag() == selectedImageIndex ? .blue : .gray)
                    .frame(width: 8, height: 8)
            }
        }
    }
    
    @ViewBuilder
    func createBikeView(_ item: CarouselBikeItem) -> some View {
        VStack {
            ZStack{
                Image(item.bikeType.getTopImageName())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize.width, height: imageSize.height)
                Image(item.bikeType.getMiddleImageName())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize.width, height: imageSize.height)
                    .colorMultiply(getColorForBike(item))
                Image(item.bikeType.getBottomImageName())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize.width, height: imageSize.height)
            }
            Text(item.bikeType.getName())
                .foregroundColor(.white)
        }.gesture(
            TapGesture()
                .onEnded { _ in
                    selectedImageIndex = item.bikeType.getTag()
                    bikeType = item.bikeType
                }
        )
    }
    
    private func getColorForBike(_ item: CarouselBikeItem) -> Color {
        guard let selectedColor = selectedColor?.color else {
            return .blue
        }
        return isSelectedBike(item) ? selectedColor : .blue
    }
    
    private func isSelectedBike(_ item: CarouselBikeItem) -> Bool {
        return item.bikeType.getTag() == selectedImageIndex
    }
}

//struct CarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarouselView(color: <#Binding<String>#>, bikeType: <#Binding<BikeType>#>)
//    }
//}
