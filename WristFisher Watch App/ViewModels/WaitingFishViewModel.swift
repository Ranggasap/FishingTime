//
//  WaitingFishViewModel.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 17/05/24.
//

import SwiftUI
import Combine

class WaitingFishViewModel: ObservableObject{
    @Published var count: Int = 0
    
    @Published var distanceValue: Double = 0.0
    
    private var timer: AnyCancellable?
    
    func startAnimationDistance(to targetDistance: Double, duration: Double = 2.0){
        let steps: Double = 50.0
        let stepDuration: Double = duration / steps
        let distanceIncrement: Double = targetDistance / steps
        
        distanceValue = 0
        
        timer = Timer.publish(every: stepDuration, on: .main, in: .common)
            .autoconnect()
            .sink{
                _ in
                withAnimation(.linear(duration: stepDuration)){
                    if self.distanceValue < targetDistance{
                        self.distanceValue += distanceIncrement
                    } else {
                        self.distanceValue = targetDistance
                        self.timer?.cancel()
                    }
                }
            }
    }
    
    func startAnimation(){
        count = 0
        timer = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink{
                _ in
                withAnimation{
                    if self.count < 3{
                        self.count += 1
                    }else{
                        self.timer?.cancel()
                    }
                }
            }
    }
}
