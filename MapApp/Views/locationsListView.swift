//
//  locationsListView.swift
//  MapApp
//
//  Created by Joseph Norris on 07/08/2023.
//

import SwiftUI

struct locationsListView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List{
            ForEach(vm.locations) { Location in
                
                Button {vm.showNextLocation(location: Location)} label: {
                    listrowview(location: Location)
                }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
               
                 
            }
        } .listStyle(.plain)
    }
}

struct locationsListView_Previews: PreviewProvider {
    static var previews: some View {
        locationsListView()
            .environmentObject(LocationsViewModel())
    }
}


extension locationsListView {
    
    private func listrowview(location: Location) -> some View { HStack{ if let imageName = location.imageNames.first{Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 45, height: 45)
            .cornerRadius(10)
    }
        VStack(alignment: .leading){
            Text(location.name)
                .font(.headline)
            Text(location.cityName)
                .font(.subheadline)
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
        
    }
    
}
