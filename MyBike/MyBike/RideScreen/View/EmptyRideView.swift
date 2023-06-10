//
//  EmptyRideView.swift
//  MyBike
//
//  Created by Darius Couti on 31.05.2023.
//

import SwiftUI

struct EmptyRideView: View {
    
    @State private var goToAddRideView = false
    
    var body: some View {
        
        VStack(spacing: 0){
                Image("missing_ride_card")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 5)
                    
            
            
                ZStack(alignment: .leading) {
                    HStack {
                        Image("dotted_line")
                            .resizable()
                            .frame(maxHeight: .infinity)
                        .padding(.leading, 20)
                        
                        Spacer(minLength: 200)
                    }

                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("""
        You don't have any ride added yet.
        Add your first ride and keep track
        of all your activities.
        """)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                            Spacer()
                        }
                        .background(Color.black.opacity(1))
                        .padding()
                        Spacer()
                        
                        Button(action: {
                            goToAddRideView.toggle()
                            
                        }) {
                            Text("Add Ride")
                                .foregroundColor(.white)
                                .font(Fonts.buttonText)
                                .padding(.horizontal, 5)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(Color.blue)
                                .cornerRadius(5)
                        }
                        .padding(.horizontal, 5)
                        NavigationLink(destination: AddRideView(), isActive: $goToAddRideView) {
                            EmptyView()
                        }
                        .hidden()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        .padding(.bottom, 5)
        .background(.black)
        }
}

struct EmptyRideView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyRideView()
    }
}
