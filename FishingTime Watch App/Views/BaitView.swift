//
//  BaitView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 17/05/24.
//

import SwiftUI

struct BaitView: View {
    var body: some View {
        VStack{
            BaitShape(size: 50.0)
            Text("Throw Bait")
                .fontWeight(.bold)
                .padding(.top, 8)
        }
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
