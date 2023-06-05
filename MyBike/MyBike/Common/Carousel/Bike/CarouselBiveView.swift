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
    @State var selectedImageIndex = 0
    @State var color: Color = .blue
    private let imageSize: CGSize = CGSize(width: 180, height: 180)
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 100) {
                ForEach(carouselItems, id: \.self) { item in
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
            ForEach(carouselItems, id: \.self) { item in
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
                    .colorMultiply(color)
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
                    self.selectedImageIndex = item.bikeType.getTag()
                }
        )
    }
}

struct CarouselBiveView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselBiveView()
    }
}
