//
//  PlaySoundsViewController.swift
//  VoiceFX
//
//  Created by Shakil Kanji on 2015-07-25.
//  Copyright (c) 2015 Shakil Kanji. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var slowPlayback: UIButton!
    
    @IBOutlet weak var fastPlayback: UIButton!
    
    @IBOutlet weak var stopPlayback: UIButton!
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopPlayback.enabled = false
        
//        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
//            var filePathURL = NSURL.fileURLWithPath(filePath)
//            
//        }
//        else {
//            println("the filepath is empty")
//        }
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil)
        audioPlayer.enableRate = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playAudio() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        stopPlayback.enabled = true
    }
    
    @IBAction func slowDownPlayback(sender: UIButton) {
        audioPlayer.rate = 0.5
        playAudio()
    }

    @IBAction func speedUpPlayback(sender: UIButton) {
        audioPlayer.rate = 2.0
        playAudio()
    }
    
    @IBAction func stopPlayback(sender: UIButton) {
        audioPlayer.stop()
        stopPlayback.enabled = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
