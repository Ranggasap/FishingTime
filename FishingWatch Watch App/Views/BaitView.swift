//
//  BaitView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 17/05/24.
//

import SwiftUI

struct BaitView: View {
    @ObservedObject private var motionViewModel = MotionViewModel()
    @State private var player = Player()
    
    @State private var isThrowed = false
    var body: some View {
        VStack{
            Text("Throw Bait")
                .fontWeight(.bold)
                .padding(.bottom, 8)
            BaitShape(size: 50.0)
            Text("Swing Your Hand")
                .font(.headline)
                .padding(.top, 8)
            
        }
        .onAppear{
            motionViewModel.startUpdates()
            motionViewModel.throwingBaitHandler()
        }
        .onDisappear{
            motionViewModel.stopUpdates()
            motionViewModel.isAccelerationHigh = false
        }
        .onChange(of: motionViewModel.isAccelerationHigh){
            accelerationHigh in
            if accelerationHigh{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    player.maxAccelerationX = motionViewModel.maxX * 10
                    player.maxAccelerationY = motionViewModel.maxY * 10
                    player.maxAccelerationZ = motionViewModel.maxZ * 10
                    isThrowed = true
                }
            }
        }
        .navigationDestination(isPresented: $isThrowed){
            FishingView(player: $player)
        }
        .environmentObject(motionViewModel)
    }
}


struct BaitShape: View {
    var size: Double
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(.red)
            Rectangle()
                .foregroundStyle(.yellow)
                .frame(height: size / 5)
        }
        .frame(width: size)
    }
}


#Preview {
    BaitView()
}
