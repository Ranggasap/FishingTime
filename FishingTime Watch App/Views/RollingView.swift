//
//  RollingView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 20/05/24.
//

import SwiftUI

struct RollingView: View {
    
    @Binding var fish: Fish
    @State var isFishCatched: Bool = false
    
    var body: some View {
        VStack{
            Text("Fish On !!!")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            FishCatchProgress(fish: $fish, isFishCatched: $isFishCatched)
            Text("Roll Your Hand")
                .font(.headline)
                .padding(.top, 8)
        }
        .navigationDestination(isPresented: $isFishCatched){
            RewardView(fish: $fish)
                .navigationBarBackButtonHidden(true)
        }
    }
}


struct FishShape: View {
    
    @Binding var fish: Fish
    
    var body: some View {
        Image(systemName: "fish.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(fish.color)
    }
}


struct CircularProgressBar: View {
    
    @Binding var progress: Double
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.blue.opacity(0.5), lineWidth: 20)
                .foregroundStyle(.blue)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.blue,style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeIn, value: progress)
        }
    }
}

struct FishCatchProgress: View {
    
    @Binding var fish: Fish
    @State var progress: Double = 0
    @State var counter: Double = 0
    @Binding var isFishCatched: Bool
    
    let hapticManager = HapticManager()
    
    @ObservedObject private var motionViewModel = MotionViewModel()
    
    var body: some View {
        VStack {
            ZStack{
                CircularProgressBar(progress: $progress)
                FishShape(fish: $fish)
                    .frame(width: 50)
            }
        }
        .frame(width: 80, height: 80)
        .onAppear{
            hapticManager.playSound(sound: .retry)
            motionViewModel.startUpdates()
            motionViewModel.rollingRodHandler()
        }
        .onDisappear{
            motionViewModel.stopUpdates()
        }
        .onChange(of: motionViewModel.singleZ){
            singleZ in
            if singleZ > 1{
                counter += 1
                progress = counter / Double(fish.power)
            }
        }
        .onChange(of: progress){
            if Int(progress) >= 1 {
                isFishCatched = true
            }
        }
    }
}

#Preview {
    RollingView(fish: .constant(Fish()))
}




