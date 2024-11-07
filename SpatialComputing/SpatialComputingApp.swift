//
//  SpatialComputingApp.swift
//  SpatialComputing
//
//  Created by honorio on 06/11/24.
//

import SwiftUI

@main
struct SpatialComputingApp: App {
    var body: some Scene {
        ImmersiveSpace {
            ContentView()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}
