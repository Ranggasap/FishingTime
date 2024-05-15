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
    private var timer: Timer?
    
    @Published var acceleration: CMAcceleration
    @Published var rotationRate: CMRotationRate
    
    init(){
        self.motionManager = CMMotionManager()
        self.motionManager.accelerometerUpdateInterval = 0.1
        self.motionManager.gyroUpdateInterval = 0.1
        self.acceleration = CMAcceleration(x: 0, y: 0, z: 0)
        self.rotationRate = CMRotationRate(x: 0, y: 0, z: 0)
    }
    
    func startUpdate(){
        if motionManager.isAccelerometerAvailable || motionManager.isGyroAvailable {
            motionManager.startAccelerometerUpdates()
            motionManager.startGyroUpdates()
            motionManager.startDeviceMotionUpdates()
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){
                [weak self] _ in
                
                if let data = self?.motionManager.accelerometerData{
                    self?.acceleration = data.acceleration
                }
                if let data = self?.motionManager.gyroData{
                    self?.rotationRate = data.rotationRate
                }
                
            }
        } else {
            print("Accelerometer or Gyro is not available:")
            print("Accelerometer Status: \(motionManager.isAccelerometerAvailable)")
            print("Gyro Status: \(motionManager.isGyroAvailable)")
            print("Device Motion Status: \(motionManager.isDeviceMotionAvailable)")
        }
    }
    
    func stopUpdates(){
        motionManager.stopAccelerometerUpdates()
        motionManager.stopGyroUpdates()
        timer?.invalidate()
    }
}
