//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Joseph Norris on 04/08/2023.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel : ObservableObject {
    
    //reference the model
    @Published var locations: [Location]
    // when we initalise it has an array of locations  aka all loaded locations
    
    @Published var mapLocation: Location{
        didSet {
            updatemapregion(location: mapLocation)
            
            //calls the fuction we dont have to update the details everytime
        }
    }
    
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    
    let mapspan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    // when this first begins it takes us to a blank map region
    
    //show list of locations
    @Published var showLocationList : Bool = false
    
    // show location detail via sheet
    
    @Published var sheetlocation : Location? = nil
     
    
    
    
    init(){
        
        // the data
        let locations = LocationsDataService.locations
        //reference the data services
        self.locations = locations
        self.mapLocation = locations.first!
        // unwrappng from the locations data service
        
        self.updatemapregion(location: locations.first!)
        
    }
    
    
    private func updatemapregion(location: Location) {
        
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
            center: location.coordinates, span: mapspan)}
            
         
        }
    
    
     func togglelocationsList() {
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
        }
    }
    
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
        
        
    }
    func nextButtonPressed(){
        
        //get the current index
        
        guard let currentindex = locations.firstIndex(where: {$0 == mapLocation})
        else {print("could not find the index in the array")
            return
        
        }
        
        let nextIndex = currentindex + 1
        guard locations.indices.contains(nextIndex) else {
            
            guard let firstlocation = locations.first else {return}
            showNextLocation(location: firstlocation)
            return
            // nextindex is not valid, restart from 0
        }
        
        let nextlocation = locations[nextIndex]
        showNextLocation(location: nextlocation)
        
        }
        
    }
    
    

