//
//  HapticManager.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 16/05/24.
//

import Foundation
import SwiftUI

struct HapticManager {
    private var hapticManager: WKInterfaceDevice
    
    init(){
        self.hapticManager = WKInterfaceDevice()
    }
    
    func playSound(sound: WKHapticType){
        hapticManager.play(sound)
    }
}
