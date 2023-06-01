//
//  BikeView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct BikeView: View {
    
//    @State var viewModel: BikeViewModel
    var bikeList = [BikeModel.testBike(),BikeModel.testBike(), BikeModel.testBike()]
    
    var body: some View {
        
            VStack {
                List(bikeList, id: \.self) { list in
                    BikeCell(model: list)
                        .padding(.top, 15)
                        .background(.black)
                }
                .scrollContentBackground(.hidden)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    
    struct BikeView_Previews: PreviewProvider {
        static var previews: some View {
            BikeView()
        }
    }
}
