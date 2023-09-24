//
//  location.swift
//  MapApp
//
//  Created by Joseph Norris on 27/07/2023.
//

import Foundation
import MapKit


struct Location: Identifiable, Equatable {

    
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    var id : String {
        // name = "colluseum" , city name = "rome", Id = "colluseumrome"
        name + cityName
        
    }
        static func == (lhs: Location, rhs: Location) -> Bool {
            lhs.id == rhs.id
        }
    }



//equatable is here to show taht when two locations have the same id then it is the same place, so right hand side and left, if have the same name then it is the same 
