//
//  RecordingSoundViewController.swift
//  Fun Recording
//
//  Created by pham quangdinh on 2015/04/29.
//  Copyright (c) 2015年 pham quangdinh. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingSoundViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopRecording: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // add a comment  
    }
    override func viewWillAppear(animated: Bool) {
        stopRecording.hidden = true
        recordingInProgress.hidden = true
    }

    @IBAction func recordingAudio(sender: UIButton) {
        println("Recording is in progress")
        recordingInProgress.hidden = false
        stopRecording.hidden = false
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        var currentDateTime = NSDate()
        var formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        var recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        var pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        // Setup Audio session 
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        // Initial and prepare for recording
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecordingAudio(sender: UIButton) {
        recordingInProgress.hidden = true
        audioRecorder.stop()
        var session = AVAudioSession.sharedInstance()
        session.setActive(false, error: nil)
    }
}

