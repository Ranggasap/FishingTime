//
//  FishingView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 17/05/24.
//

import SwiftUI

struct FishingView: View {
    
    @Binding var player: Player
    @State var isFishOn: Bool = false
    @State var fish: Fish = Fish()
    
    let fishPickerManager = FishPickerManager()
    
    let hapticManager = HapticManager()
    
    var body: some View {
        VStack{
            DistanceText(distance: player.maxAccelerationY / 3 + player.maxAccelerationX / 3 + player.maxAccelerationZ / 3)
            WaitingFish(isFishOn: $isFishOn)
            DistanceImage(distance: 8)
                .padding(.top, 24)
        }
        .onAppear{
            let distance = player.maxAccelerationX / 3 + player.maxAccelerationY / 3 + player.maxAccelerationZ / 3
            if distance > 20 {
                fish = fishPickerManager.fishPickerLongDistance()
            } else if distance > 15 {
                fish = fishPickerManager.fishPickerMidDistance()
            } else{
                fish = fishPickerManager.fishPickerLowDistance()
            }
            print(fish)
            hapticManager.playSound(sound: .start)
        }
        .navigationDestination(isPresented: $isFishOn){
            RollingView(fish: $fish)
                .navigationBarBackButtonHidden(true)
        }
    }
}


struct DistanceText: View {
    
    @StateObject private var viewModel = WaitingFishViewModel()
    var distance: Double = 0.0
    
    var body: some View {
        Text("Distance \(String(format:"%.2f" ,viewModel.distanceValue)) M")
            .fontWeight(.bold)
            .onAppear{
                viewModel.startAnimationDistance(to: distance)
            }
    }
}

struct DistanceImage: View {
    @State var distance: CGFloat = 0
    
    var body: some View {
        HStack(alignment: .bottom,spacing: distance){
            Image(systemName: "figure.fishing")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            VStack{
                BaitShape(size: 10)
            }
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 1)){
                if distance > 8{
                    distance = 64
                }else{
                    distance = distance * 8
                }
            }
        }
    }
}

struct WaitingFish: View {
    
    @StateObject private var viewModel = WaitingFishViewModel()
    @Binding var isFishOn: Bool
    
    var body: some View {
        HStack{
            ForEach(0..<viewModel.count, id: \.self){
                _ in
                Text(".")
                    .bold()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                viewModel.startAnimation()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                isFishOn.toggle()
            }
        }
    }
}



#Preview {
    FishingView(player: .constant(Player()))
}
