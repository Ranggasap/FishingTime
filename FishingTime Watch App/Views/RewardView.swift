//
//  RewardView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 20/05/24.
//

import SwiftUI

struct RewardView: View {
    var body: some View {
        VStack{
            Text("Congratulation")
                .font(.title3)
                .fontWeight(.bold)
            Image("whale")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 75)
            Text("You've Got Whale")
            Text("Legendary")
                .foregroundStyle(.yellow)
            FinishButton()
        }
    }
}

struct FinishButton: View {
    var body: some View {
        Button(action: {}, label: {
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
    RewardView()
}
