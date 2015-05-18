//
//  PlayingSoundControllerViewController.swift
//  Fun Recording
//
//  Created by pham quangdinh on 2015/05/07.
//  Copyright (c) 2015年 pham quangdinh. All rights reserved.
//

import UIKit
import AVFoundation
class PlayingSoundControllerViewController: UIViewController {
    var audioPlayer:AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            var fileURL = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        } else {
            println("the filePath is empty")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playingSlowSound(sender: UIButton) {
       playAudioSound(0.5)
    }

    @IBAction func playingFastSound(sender: UIButton) {
        playAudioSound(1.5)
    }
    @IBAction func stopPlaySound(sender: UIButton) {
        audioPlayer.stop()
    }
    
    func playAudioSound( rateTime:Float) {
        audioPlayer.stop()
        audioPlayer.enableRate = true
        audioPlayer.rate = rateTime
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
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
