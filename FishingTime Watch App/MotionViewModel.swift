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
    
    private let maxDataPoints = 100
    private var cancellables = Set<AnyCancellable>()
    private var motionManager = MotionManager()
    
    init(){
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
            }
            .store(in: &cancellables)
    }
    
    func startUpdates(){
        motionManager.startUpdate()
    }
    
    func stopUpdates(){
        motionManager.stopUpdates()
    }
}
