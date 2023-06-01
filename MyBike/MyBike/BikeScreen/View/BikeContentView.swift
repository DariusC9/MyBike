//
//  BikeContentView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import SwiftUI

struct BikeContentView: View {
    
    var viewModel: BikeContentViewModel
    
    var body: some View {
        VStack {
            if viewModel.shouldShowEmptyScreen {
                EmptyBikeView()
            } else {
                BikeView()
            }
        }
    }
}

struct BikeContentView_Previews: PreviewProvider {
    static var previews: some View {
        BikeContentView(viewModel: BikeContentViewModel())
    }
}
