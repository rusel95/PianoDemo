import Foundation
import AVFoundation

struct Audios{
    let notes = ["До","Ре","Ми","Фа","Со","Ля","Си"]
    var audioArray:[Audio] = []

    init(){

        var bundle = String()
        for i in 0..<notes.count {
            bundle = Bundle.main.path(forResource: self.notes[i], ofType: "mp3")!
            let path = URL(fileURLWithPath: bundle)
            self.audioArray.append(Audio(path))
        }

    }

    mutating func playback(_ buttonTitle: String) {
        var soundNumber = Int()
        switch buttonTitle {
        case notes[0]:
            soundNumber = 0
        case notes[1]:
            soundNumber = 1
        case notes[2]:
            soundNumber = 2
        case notes[3]:
            soundNumber = 3
        case notes[4]:
            soundNumber = 4
        case notes[5]:
            soundNumber = 5
        case notes[6]:
            soundNumber = 6
        default:
            print("Rusel was here")
        }
        self.audioArray[soundNumber].playSound()
    }
}

struct Audio {

    var audioURl: URL?
    var audioPlayer = AVAudioPlayer()

    init(_ audioUrl: URL) {
        self.audioURl = audioUrl
    }

    mutating func playSound()  {
        self.audioPlayer = try! AVAudioPlayer(contentsOf: self.audioURl!)
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.currentTime = 0
        self.audioPlayer.play()
    }
    
}
