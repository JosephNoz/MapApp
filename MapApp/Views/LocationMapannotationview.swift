//
//  LocationMapannotationview.swift
//  MapApp
//
//  Created by Joseph Norris on 08/08/2023.
//

import SwiftUI

struct LocationMapannotationview: View {
    
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width:10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(x: 0, y: -3)
                .padding(.bottom, 40)
        }
            
            
        }
    }


struct LocationMapannotationview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            LocationMapannotationview()
        }
    }
}
