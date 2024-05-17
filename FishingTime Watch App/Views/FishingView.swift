//
//  FishingView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 17/05/24.
//

import SwiftUI

struct FishingView: View {
    var body: some View {
        VStack{
            DistanceText(distance: 9.23)
            WaitingFish()
            DistanceImage(distance: 8)
                .padding(.top, 24)
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
        }
    }
}



#Preview {
    FishingView()
}
