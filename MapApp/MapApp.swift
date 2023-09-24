//
//  MapApp.swift
//  MapApp
//
//  Created by Joseph Norris on 27/07/2023.
//

import SwiftUI

@main
struct MapApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
