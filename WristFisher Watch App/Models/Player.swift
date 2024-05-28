//
//  Player.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 16/05/24.
//

import Foundation

struct Player: Hashable, Identifiable {
    internal var id: UUID
    var maxAccelerationX: Double
    var maxAccelerationY: Double
    var maxAccelerationZ: Double
    
    init() {
        self.id = UUID()
        self.maxAccelerationX = 0.0
        self.maxAccelerationY = 0.0
        self.maxAccelerationZ = 0.0
    }
}
