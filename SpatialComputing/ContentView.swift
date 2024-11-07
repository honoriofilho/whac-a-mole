//
//  ContentView.swift
//  SpatialComputing
//
//  Created by honorio on 06/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Topeira", bundle: realityKitContentBundle)
            Text("Hello, world!")
        }
        .gesture(TapGesture().targetedToAnyEntity()
            .onEnded({ value in
                _ = value.entity.applyTapForBehaviors()
            })
        )
        //.padding()
    }
}

#Preview(windowStyle: .plain) {
    ContentView()
}
