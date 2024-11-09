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
    @State private var up: AnimationResource?
    @State private var down: AnimationResource?

    var body: some View {
        VStack {
            RealityView { content in
                // Carregar a entidade USDZ com animação
                if let entity = try? await Entity(named: "pinguim", in: realityKitContentBundle) {
                    
                    if let animation = entity.availableAnimations.last {
                        let upView = AnimationView(
                            source: animation.definition,
                            name: "up",
                            bindTarget: nil,
                            blendLayer: 0,
                            repeatMode: .autoReverse,
                            fillMode: [],
                            trimStart: 0.0,
                            trimEnd: 2.0,
                            trimDuration: 2.0,
                            offset: 0,
                            delay: 0,
                            speed: 1.0)
                        
                        up = try? AnimationResource.generate(with: upView)
                        
                        
                        let downView = AnimationView(
                            source: animation.definition,
                            name: "down",
                            bindTarget: nil,
                            blendLayer: 0,
                            repeatMode: .autoReverse,
                            fillMode: [],
                            trimStart: 2.0,
                            trimEnd: 4.0,
                            trimDuration: 2.0,
                            offset: 0,
                            delay: 0,
                            speed: 1.0)
                        
                        down = try? AnimationResource.generate(with: downView)
                        
                        entity.playAnimation(down!)
                    }
                    
                    content.add(entity)
                } else {
                    print("Erro ao carregar a entidade ou animação")
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
