//
//  PlaySound.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 11/04/24.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String,type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR, File is unable to play.")
        }
    }
}
