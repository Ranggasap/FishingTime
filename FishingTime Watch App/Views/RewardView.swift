//
//  RewardView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 20/05/24.
//

import SwiftUI

struct RewardView: View {
    
    @Binding var fish: Fish
    
    let hapticManager = HapticManager()
    
    var body: some View {
        VStack{
            Text("Congratulation")
                .font(.title3)
                .fontWeight(.bold)
            Image("\(fish.image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 75)
            Text("You've Got \(fish.name)")
            Text("\(fish.rarity)")
                .foregroundStyle(fish.color)
            FinishButton()
        }
        .onAppear{
            hapticManager.playSound(sound: .success)
        }
    }
}

struct FinishButton: View {
    
    @EnvironmentObject var pathViewModel: PathViewModel
    
    var body: some View {
        Button(action: {
            pathViewModel.removeAllPath()
        }, label: {
            Text("Booyah !!!")
                .padding()
                .frame(width: 150)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        })
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    RewardView(fish: .constant(Fish()))
}
