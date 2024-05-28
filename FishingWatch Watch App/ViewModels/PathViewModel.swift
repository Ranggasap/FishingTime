//
//  PathViewModel.swift
//  FishingTime Watch App
//
//  Created by Rangga Saputra on 16/05/24.
//

import Foundation

class PathViewModel: ObservableObject{
    @Published var stackPath: [Player] = []
    
    func addPath(player: Player){
        stackPath.append(player)
    }
    
    func removeLastPath(){
        stackPath.removeLast()
    }
    
    func removeAllPath(){
        stackPath.removeAll()
    }
}
