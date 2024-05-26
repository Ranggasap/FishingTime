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
        self.image = "Carp"
        self.power = 10
    }
    
    mutating func kraken(){
        self.name = "Kraken"
        self.rarity = "Mythical"
        self.color = Color.red
        self.image = "Kraken"
        self.power = 40
    }
    
    mutating func whale(){
        self.name = "Whale"
        self.rarity = "Legendary"
        self.color = Color.yellow
        self.image = "Whale"
        self.power = 38
    }
    
    mutating func shark(){
        self.name = "Shark"
        self.rarity = "Legendary"
        self.color = Color.yellow
        self.image = "Shark"
        self.power = 35
    }
    
    mutating func tuna(){
        self.name = "Tuna"
        self.rarity = "Epic"
        self.color = Color.purple
        self.image = "Tuna"
        self.power = 30
    }
    
    mutating func kingKrab(){
        self.name = "King Krab"
        self.rarity = "Epic"
        self.color = Color.purple
        self.image = "Tuna"
        self.power = 28
    }
    
    mutating func anglerFish(){
        self.name = "Angler Fish"
        self.rarity = "Epic"
        self.color = Color.purple
        self.image = "Tuna"
        self.power = 25
    }
    
    mutating func carp(){
        self.name = "Carp"
        self.rarity = "Rare"
        self.color = Color.blue
        self.image = "Carp"
        self.power = 20
    }
    
    mutating func stingRay(){
        self.name = "Stingray"
        self.rarity = "Rare"
        self.color = Color.blue
        self.image = "StingRay"
        self.power = 18
    }
    
    mutating func jellyFish(){
        self.name = "Jelly Fish"
        self.rarity = "Common"
        self.color = Color.green
        self.image = "JellyFish"
        self.power = 10
    }
    
    mutating func mackarel(){
        self.name = "Mackarel"
        self.rarity = "Common"
        self.color = Color.green
        self.image = "Mackarel"
        self.power = 15
    }
}
