//
//  CarouselColorView.swift
//  MyBike
//
//  Created by Darius Couti on 01.06.2023.
//

import Foundation
import SwiftUI

struct CarouselColorItem: Hashable {
    
    let ID = UUID()
    let color: Color
    var isSelected: Bool = false
    var actionWhenSelected: ((CarouselColorItem) -> Void)?
    
    static func defaultItem() -> CarouselColorItem {
        return CarouselColorItem(color: .blue,
                            isSelected: false,
                            actionWhenSelected: { item in
            print("Pushed \(item)")
        })
    }
    
    // MARK: - Protocol Methods
    
    static func == (lhs: CarouselColorItem, rhs: CarouselColorItem) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ID)
    }
    
}

struct CarouselColorItemView: View {
    @State var item: CarouselColorItem
    @State var borderColor: Color = .clear
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(item.color)
                .border(borderColor, width: 2)
        }.gesture(
            TapGesture()
                .onEnded { _ in
                    item.isSelected = true
                    borderColor = .white
                    item.actionWhenSelected?(item)
                }
        )
    }
    
    struct CarouselItemView_Previews: PreviewProvider {
        static var previews: some View {
            CarouselColorItemView(item: CarouselColorItem.defaultItem())
        }
    }
}

