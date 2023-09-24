//
//  locationdetailview.swift
//  MapApp
//
//  Created by Joseph Norris on 08/08/2023.
//

import SwiftUI
import MapKit

struct locationdetailview: View {
    
    let location : Location
    @EnvironmentObject private var vm : LocationsViewModel
    var body: some View {
        
        ScrollView{
            VStack{
                imagescrollsection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16 )
                {
                    
                    titlesection
                
                    Divider()
                    
                    descriptionsection
                    
                    Divider()
                    
                    mapview
            
                    
                    
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
            }
            
        } .ignoresSafeArea()
            .background(.ultraThinMaterial)
            .overlay(backbutton, alignment: .topLeading)
    }
}
    
    struct locationdetailview_Previews: PreviewProvider {
        static var previews: some View {
            locationdetailview(location: LocationsDataService.locations.first!)
                .environmentObject(LocationsViewModel())
        }
    }
    

    
extension locationdetailview {
    
    private var imagescrollsection : some View {
        
        
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                
            }
            
            
        }.frame(height: 500)
            .tabViewStyle(PageTabViewStyle())
    }
    
    
    private var titlesection : some View {
        
        VStack(alignment: .leading, spacing: 8)
        {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
            
        }
    }
    
    
    
    private var descriptionsection : some View {
        VStack(alignment: .leading, spacing: 16)
        {
            Text(location.description)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link){
                
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
        
    }
    
    private var mapview : some View {
        
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
               LocationMapannotationview()
                    .shadow(radius: 10)
        }
        }
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
        .allowsHitTesting(false)
        //
        //        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
        //             MapAnnotation(coordinate: location.coordinates) {
        //                 Image(systemName: "mappin.circle")
        //                     .foregroundColor(.red)
        //                     .scaleEffect(vm.mapLocation == location ? 1 :0.5)
        //                     .shadow(radius: 10)
        //                     .onTapGesture {
        //                        vm.showNextLocation(location: location)
        //                    }
        //             }
        //          })
        //              .ignoresSafeArea()
        //      }
        
  }
    
    private var backbutton : some View {
        
        Button {
            vm.sheetlocation = nil
        } label: {
            Image(systemName: "xmark.app")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
            
            
        }

    }
    
    
    
}
