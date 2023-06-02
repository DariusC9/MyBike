//
//  CarouselView.swift
//  MyBike
//
//  Created by Darius Couti on 02.06.2023.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        VStack {
            CarouselColorView()
            CarouselBiveView()
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
