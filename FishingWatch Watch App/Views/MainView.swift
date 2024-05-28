//
//  MainView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 16/05/24.
//

import SwiftUI

struct MainView: View {
    private var hapticManager = HapticManager()
    
    @ObservedObject private var pathViewModel = PathViewModel()
    
    var body: some View {
        NavigationStack(path: $pathViewModel.stackPath){
            VStack{
                Image(systemName: "figure.fishing")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100)
                
                BlinkingText()
            }
            .onTapGesture {
                hapticManager.playSound(sound: .start)
                pathViewModel.addPath(player: Player())
            }
            .navigationDestination(for: Player.self){ player in
                BaitView()
            }
        }
        .environmentObject(pathViewModel)
        
    }
}


struct BlinkingText: View {
    
    @State private var isBlinking = false
    
    var body: some View {
        Text("Click Anywhere")
            .bold()
            .padding(.top, 8)
            .opacity(isBlinking ? 0.5 : 1)
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){
                    _ in
                    withAnimation{
                        isBlinking.toggle()
                    }
                }
            }
    }
}


#Preview {
    MainView()
}
