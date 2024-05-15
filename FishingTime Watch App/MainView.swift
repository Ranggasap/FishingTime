//
//  MainView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 14/05/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var motionManager = MotionManager()
    var body: some View {
        VStack{
            Text("Acceleration:")
            Text("x: \(motionManager.acceleration.x)")
            Text("y: \(motionManager.acceleration.y)")
            Text("z: \(motionManager.acceleration.z)")
           
            Text("Rotation Rate:")
            Text("x: \(motionManager.rotationRate.x)")
            Text("y: \(motionManager.rotationRate.y)")
            Text("z: \(motionManager.rotationRate.z)")
           
        }
        .onAppear{
            motionManager.startUpdate()
        }
        .onDisappear{
            motionManager.stopUpdates()
        }
    }
}

#Preview {
    MainView()
}
