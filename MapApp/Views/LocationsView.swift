//
//  LocationsView.swift
//  MapApp
//
//  Created by Joseph Norris on 27/07/2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    //references the view model which refereces all the model data and location data services
    @EnvironmentObject private var vm : LocationsViewModel
    
    
    var body: some View {
        ZStack{
            
           mapview
            
            
            VStack (spacing: 0){
                
                header
                .padding()
                
                Spacer()
                
                
                locationpreviewview
                }
            }
        .sheet(item: $vm.sheetlocation) { location in
            locationdetailview(location: location)
        }
                
            }
            
                
            }
        
    


struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsView {
    
    private var header: some View {
            VStack{
                Button(action: vm.togglelocationsList) {
                    Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(height: 50)
                        .frame(maxWidth:.infinity)
                        .animation(.none, value: vm.mapLocation )
                        .overlay(alignment : .leading) {
                        Image(systemName: "arrowtriangle.right")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationList ? 90 : 0))
                }
                            
        }
                    
                if vm.showLocationList {
                    locationsListView()
                }
            }
            .background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y:15)
            
        }
    
    private var locationpreviewview : some View{
        ZStack{
            //* a for each loop that goes through all the locations in the array and finds the selected one (true); before this bool condition we would have it has all the locations
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
            }
        
    }
    
    private var mapview : some View {
        
        
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapannotationview()
                    .scaleEffect(vm.mapLocation == location ? 0.7 :0.5)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
            .ignoresSafeArea()
    }
}

    

