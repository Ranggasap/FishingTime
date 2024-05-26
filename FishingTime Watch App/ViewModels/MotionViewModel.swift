//
//  MotionViewModel.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 15/05/24.
//

import Foundation
import Combine

class MotionViewModel: ObservableObject{
    @Published var x: [Double] = []
    @Published var y: [Double] = []
    @Published var z: [Double] = []
    
    @Published var singleX: Double = 0
    @Published var singleY: Double = 0
    @Published var singleZ: Double = 0
    
    @Published var maxX: Double = 0
    @Published var maxY: Double = 0
    @Published var maxZ: Double = 0
    
    @Published var isAccelerationHigh: Bool = false
    
    private let maxDataPoints = 100
    private var cancellables = Set<AnyCancellable>()
    private var motionManager = MotionManager()
    
    func startUpdates(){
        motionManager.startUpdate()
    }
    
    func throwingBaitHandler(){
        motionManager.$userAcceleration.receive(on: DispatchQueue.main)
            .sink{
                [weak self] acceleration in
                guard let self = self else {return}
                self.x.append(acceleration.x)
                self.y.append(acceleration.y)
                self.z.append(acceleration.z)
                
                if self.x.count > 100{
                    self.x.removeFirst()
                    self.y.removeFirst()
                    self.z.removeFirst()
                }
                
                if acceleration.x > self.maxX{
                    self.maxX = acceleration.x
                }
                
                if acceleration.y > self.maxY{
                    self.maxY = acceleration.y
                }
                
                if acceleration.z > self.maxZ{
                    self.maxZ = acceleration.z
                }
                
                self.isAccelerationHigh = acceleration.y > 1.0 || acceleration.z > 1.0
            }
            .store(in: &cancellables)
    }
    
    func rollingRodHandler(){
        motionManager.$userAcceleration.receive(on: DispatchQueue.main)
            .sink{
                [weak self] acceleration in
                guard let self = self else {return}
                
                self.singleX = acceleration.x
                self.singleY = acceleration.y
                self.singleZ = acceleration.z
                
            }
            .store(in: &cancellables)
    }
    
    func stopUpdates(){
        motionManager.stopUpdates()
    }
}
