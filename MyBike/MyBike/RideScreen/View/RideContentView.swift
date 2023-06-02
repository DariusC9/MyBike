//
//  RideContentView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct RideContentView: View {
    
    private var viewModel = RideContentViewModel()
    
    var body: some View {
        if viewModel.shouldShowEmptyScreen {
            EmptyRideView()
        } else {
            RideView()
        }
    }
}

struct RideContentView_Previews: PreviewProvider {
    static var previews: some View {
        RideContentView()
    }
}
