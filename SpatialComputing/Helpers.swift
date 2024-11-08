//
//  Helpers.swift
//  SpatialComputing
//
//  Created by honorio on 08/11/24.
//

import RealityKit
import Foundation
import Combine
import Spatial


// Possible robot states.
public enum TopeiraState: String, Codable {
    case available
}

@MainActor
public struct TopeiraRuntimeComponent: Component {
    
    internal var settingsSource: TopeiraComponent? = nil
    
    // Current state of the plant.
    internal var currentState: TopeiraState = .available
    
    // Returns true if the robot is available for tending a plant.
    public func isAvailable() -> Bool {
        return currentState == .available
    }
}

// The component stores information about the robot and provides the ability
// to manipulate the internal and visual state of the robot.
public struct TopeiraComponent: Component, Codable {
    // Defines how long (in seconds) it takes to fully enable or fully disable IK.
    public var ikTotalBlendTime: Float = 0.2
}


