//
//  TestMaxView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 20/05/24.
//

import SwiftUI

struct TestMaxView: View {
    
    @ObservedObject private var motionViewModel = MotionViewModel()
    
    var body: some View {
        VStack{
            Text("Max X: \(String(format:"%.5f" , motionViewModel.maxX))")
            Text("Max Y: \(String(format: "%.5f", motionViewModel.maxY))")
            Text("Max Z: \(String(format: "%.5f", motionViewModel.maxZ))")
        }
        .onAppear{
            motionViewModel.startUpdates()
            motionViewModel.throwingBaitHandler()
        }
        .onDisappear{
            motionViewModel.stopUpdates()
        }
    }
}

#Preview {
    TestMaxView()
}
