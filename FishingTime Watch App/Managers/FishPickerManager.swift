//
//  FishPickerManager.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 22/05/24.
//

import Foundation

class FishPickerManager{
    
    private var fish: Fish
    
    private var randomInt: Int
    
    init(){
        self.fish = Fish()
        randomInt = Int.random(in: 1..<20)
    }
    
    func randomNumberGenerator(){
        randomInt = Int.random(in: 1..<20)
    }
    
    func fishPickerLowDistance() -> Fish{
        randomNumberGenerator()
        switch randomInt{
        case 1..<2:
            mythicalFishPicker()
        case 2..<4:
            legendaryFishPicker()
        case 4..<8:
            epicFishPicker()
        case 8..<12:
            rareFishPicker()
        default:
            commonFishPicker()
        }
        return self.fish
    }
    
    func fishPickerMidDistance() -> Fish{
        randomNumberGenerator()
        switch randomInt{
        case 1..<2:
            commonFishPicker()
        case 2..<4:
            mythicalFishPicker()
        case 4..<8:
            legendaryFishPicker()
        case 8..<12:
            epicFishPicker()
        default:
            rareFishPicker()
        }
        return fish
    }
    
    func fishPickerLongDistance() -> Fish{
        randomNumberGenerator()
        switch randomInt{
        case 1..<2:
            rareFishPicker()
        case 2..<4:
            commonFishPicker()
        case 4..<8:
            mythicalFishPicker()
        case 8..<12:
            legendaryFishPicker()
        default:
            epicFishPicker()
        }
        return fish
    }
    
    func mythicalFishPicker(){
        fish.kraken()
    }
    
    func legendaryFishPicker(){
        randomNumberGenerator()
        switch randomInt{
        case 1..<11:
            fish.whale()
        default:
            fish.shark()
        }
    }
    
    func epicFishPicker(){
        randomNumberGenerator()
        switch randomInt{
        case 1..<7:
            fish.kingKrab()
        case 7..<15:
            fish.anglerFish()
        default:
            fish.tuna()
        }
    }
    
    func rareFishPicker(){
        randomNumberGenerator()
        switch randomInt{
        case 1..<11:
            fish.stingRay()
        default:
            fish.carp()
        }
    }
    
    func commonFishPicker(){
        randomNumberGenerator()
        switch randomInt{
        case 1..<11:
            fish.jellyFish()
        default:
            fish.mackarel()
        }
    }
}
