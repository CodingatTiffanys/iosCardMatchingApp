//
//  SoundManager.swift
//  MatchingCardApp
//
//  Created by Tiffany on 5/28/20.
//  Copyright © 2020 Tiffany. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer:AVAudioPlayer?
    
    
    enum SoundEffect {
        case flip
        case match
        case nomatch
        case shuffle
        
    }
    
    func playSound(effect: SoundEffect) {
        
        var soundFilename = ""
        
        switch effect {
        case .flip:
            soundFilename = "cardflip"
            
        case .match:
            soundFilename = "dingcorrect"
            
        case .nomatch:
            soundFilename = "dingwrong"
            
        case .shuffle:
            soundFilename = "shuffle"
                                             

        }
        //Get path to the resource
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: ".wave")
        
        //Check that its not nil
        guard bundlePath != nil else {
            //Couldnt find the resource
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        do {
            
            //Create the audio player
            audioPlayer = try AVAudioPlayer(contentsOf: url)

            //Play the sound effect
            audioPlayer?.play()
        }
        
        catch {
            print("Couldn't create an audio player")
            return
        }
    }
}
