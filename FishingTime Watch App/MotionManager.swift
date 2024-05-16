//
//  MotionManager.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 14/05/24.
//

import Foundation
import CoreMotion
import Combine

class MotionManager: ObservableObject {
    private var motionManager: CMMotionManager
    
    @Published var userAcceleration: CMAcceleration = CMAcceleration()
    
    init(){
        self.motionManager = CMMotionManager()
        self.motionManager.deviceMotionUpdateInterval = 0.1
    }
    
    func startUpdate(){
        if self.motionManager.isDeviceMotionAvailable {
            self.motionManager.startDeviceMotionUpdates(to: OperationQueue.main){ [weak self] (data, error) in
                guard let data = data else {return}
                
                self?.userAcceleration = data.userAcceleration
            }
        } else {
            print("Accelerometer or Gyro is not available:")
            print("Accelerometer Status: \(motionManager.isAccelerometerAvailable)")
            print("Gyro Status: \(motionManager.isGyroAvailable)")
            print("Device Motion Status: \(motionManager.isDeviceMotionAvailable)")
        }
    }
    
    func stopUpdates(){
        motionManager.stopDeviceMotionUpdates()
    }
}
