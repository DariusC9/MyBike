//
//  EmptyBikeView.swift
//  MyBike
//
//  Created by Darius Couti on 31.05.2023.
//

import SwiftUI

struct EmptyBikeView: View {
    @State private var goToAddBikeView = false
    var body: some View {
        
        VStack(spacing: 0){
            Image("missing_bike_card")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 5)
                .background(.black)
            ZStack(alignment: .leading) {
                Image("dotted_line")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("""
        You don't have any bike added yet.
        Add your first bike and start register
        your rides in order to keep your bike
        service cycles up to date.
        """)
                        .multilineTextAlignment(.center)
                        .font(Fonts.buttonText)
                        .foregroundColor(.white)
                        .padding()
                        Spacer()
                    }
                    .background(Color.black.opacity(1))
                    .padding()
                    Spacer()
                    
                    Button(action: {
                        // TODO: Add action
                        goToAddBikeView.toggle()
                    }) {
                        Text("Add Bike")
                            .foregroundColor(.white)
                            .font(Fonts.buttonText)
                            .padding(.horizontal, 5)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                    .padding(5)
                    NavigationLink(destination: AddBikeView(), isActive: $goToAddBikeView) {
                        EmptyView()
                    }
                    .hidden()
                    
                }
            }
            .background(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct EmptyBikeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBikeView()
    }
}

