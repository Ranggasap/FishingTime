//
//  RollingView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 20/05/24.
//

import SwiftUI

struct RollingView: View {
    var body: some View {
        VStack{
            Text("Fish On !!!")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top, 24)
                .padding(.bottom, 16)
            FishCatchProgress()
            Text("Roll Your Hand")
                .font(.headline)
                .padding(.top, 16)
        }
        .ignoresSafeArea()
    }
}


struct FishShape: View {
    var body: some View {
        Image(systemName: "fish.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}


struct CircularProgressBar: View {
    
    @State var progress: Double = 0.20
    
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
    var body: some View {
        VStack {
            ZStack{
                CircularProgressBar(progress: 0.3)
                FishShape()
                    .frame(width: 80)
            }
        }
        .frame(width: 125, height: 125)
    }
}

#Preview {
    RollingView()
}




