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
            RealityView { content in
                if let entity = try? await Entity(named: "buraco_pinguim", in: realityKitContentBundle) {
                    for anim in entity.availableAnimations {
                        entity.playAnimation(anim.repeat(duration: .infinity),
                                             transitionDuration: 1.25,startsPaused: true)
                    }
                    content.add(entity)
                } else {
                    print("Erro ao carregar a entidade ou animação")
                }
            }
        }
        .gesture(TapGesture().targetedToAnyEntity()
            .onEnded({ value in
                _ = value.entity.applyTapForBehaviors()
            })
        )
    }
    
    
    // MARK: Helpers
    private func getTopeiraIfAvailable(scene: RealityFoundation.Scene) -> Entity? {
        if let topeira = scene.findEntity(named: "Topeira"),
           let topeiraComponent = topeira.components[TopeiraRuntimeComponent.self],
           topeiraComponent.isAvailable() {
            return topeira
        }

        return nil
    }

    private func getTopeira(from scene: RealityFoundation.Scene?) -> Entity? {
        guard let topeira = scene?.findEntity(named: "Topeira"),
              topeira.components[TopeiraRuntimeComponent.self] != nil else {
            return nil
        }

        return topeira
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
