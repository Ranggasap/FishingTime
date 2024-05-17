//
//  Player.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 16/05/24.
//

import Foundation

struct Player: Hashable, Identifiable {
    internal var id: UUID
    private var maxAccelerationX: Double
    private var maxAccelerationY: Double
    private var maxAccelerationZ: Double
    
    init(){
        self.id = UUID()
        self.maxAccelerationX = 0
        self.maxAccelerationY = 0
        self.maxAccelerationZ = 0
    }
}
