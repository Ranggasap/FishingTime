//
//  Fish.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 20/05/24.
//

import Foundation
import SwiftUI

struct Fish: Identifiable{
    internal var id: UUID
    var name: String
    var rarity: String
    var color: Color
    var image: String
    var power: Int
    
    init() {
        self.id = UUID()
        self.name = "Ikan"
        self.rarity = "Unknown"
        self.color = Color.gray
        self.image = "whale"
        self.power = 99
    }
    
    mutating func whale(){
        self.name = "Whale"
        self.rarity = "Legendary"
        self.color = Color.yellow
        self.image = "whale"
        self.power = 50
    }
    
    mutating func tuna(){
        self.name = "Tuna"
        self.rarity = "Epic"
        self.color = Color.purple
        self.image = "whale"
        self.power = 40
    }
    
    mutating func kakap(){
        self.name = "Kakap"
        self.rarity = "Rare"
        self.color = Color.blue
        self.image = "whale"
        self.power = 30
    }
    
    mutating func tongkol(){
        self.name = "Tongkol"
        self.rarity = "Common"
        self.color = Color.gray
        self.image = "whale"
        self.power = 20
    }
    
    mutating func randomFishPicker(){
        let randomInt = Int.random(in: 0..<5)
        switch randomInt{
        case 4:
            whale()
        case 3:
            tuna()
        case 2:
            kakap()
        default:
            tongkol()
        }
    }
}
