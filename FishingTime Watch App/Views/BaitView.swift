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
            BaitShape()
            Text("Throw Bait")
                .fontWeight(.bold)
                .padding(.top, 8)
        }
    }
}


struct BaitShape: View {
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(.red)
            Rectangle()
                .foregroundStyle(.yellow)
                .frame(height: 10)
        }
        .frame(width: 50)
    }
}


#Preview {
    BaitView()
}
