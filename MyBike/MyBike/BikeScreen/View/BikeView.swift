//
//  BikeView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct BikeView: View {
    
//    @State var viewModel: BikeViewModel
    var bikeList: [BikeModel]
    
    var body: some View {
        
            VStack {
                List(bikeList, id: \.self) { item in
                    BikeCell(model: item)
                        .padding(.top, 15)
                        .background(.black)
                        .onTapGesture {
                            print("it works")
                        }
                }
                .scrollContentBackground(.hidden)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    
    struct BikeView_Previews: PreviewProvider {
        static var previews: some View {
            BikeView(bikeList: [BikeModel.testBike()])
        }
    }
}
