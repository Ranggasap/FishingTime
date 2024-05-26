//
//  HapticView.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 16/05/24.
//

import SwiftUI

struct HapticView: View {
    private var hapticManager = HapticManager()
    
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Button(action: {hapticManager.playSound(sound: .directionUp)}, label: {
                        Text("Up")
                    })
                    Button(action: {hapticManager.playSound(sound: .directionDown)}, label: {
                        Text("Down")
                    })
                }
                HStack{
                    Button(action: {hapticManager.playSound(sound: .success)}, label: {
                        Text("Success")
                    })
                    Button(action: {hapticManager.playSound(sound: .failure)}, label: {
                        Text("Fail")
                    })
                }
                HStack{
                    Button(action: {hapticManager.playSound(sound: .retry)}, label: {
                        Text("Retry")
                    })
                    Button(action: {hapticManager.playSound(sound: .start)}, label: {
                        Text("Start")
                    })
                }
                HStack{
                    Button(action: {hapticManager.playSound(sound: .stop)}, label: {
                        Text("Stop")
                    })
                    Button(action: {hapticManager.playSound(sound: .click)}, label: {
                        Text("Click")
                    })
                }
            }
        }
    }
}

#Preview {
    HapticView()
}
