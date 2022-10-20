//
//  SoundsBootcamp.swift
//  ContinuedLearning
//
//  Created by Chi Dung on 26/09/2022.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = URL(string: "") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }   catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    var soundManager = SoundManager()
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                
            }
            Button("Play sound 2") {
                
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
