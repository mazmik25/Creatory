//
//  RecordVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 19/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import AVFoundation

protocol RecordVCDelegate: class {
    func onRecording(playerId: Int)
    func onDoneRecording(path: String)
}

class RecordVC: UIViewController {

    @IBOutlet weak var nameRecorded: UILabel!
    @IBOutlet weak var tapToRecordLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var deleteSound: UIButton!
    @IBOutlet weak var saveSound: UIButton!

    weak var delegate: RecordVCDelegate?
    var playerId: Int?
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.isEnabled = false
        deleteSound.isEnabled = false
        saveSound.isEnabled = false
        setupRecord()
    }
    
    //setup recording
    func setupRecord() {
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self]
                allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    }
                }
            }
        } catch  {
            print(error)
        }
        
    }
    
    func loadRecordingUI() {
        recordButton.isEnabled = true
        playButton.isEnabled = false
        deleteSound.isEnabled = false
        saveSound.isEnabled = false
        tapToRecordLabel.text = "Tap to record"
        
        recordButton.setImage(UIImage(named: "record"), for: .normal)
        recordButton.addTarget(self, action: #selector(recordAudioButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func recordAudioButtonTapped(_ sender: UIButton) {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func startRecording() {
        let audioFilename = getFileURL()
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            tapToRecordLabel.text = "Tap to Stop"
            recordButton.setImage(UIImage(named: "stop"), for: .normal)
            playButton.isEnabled = false
            deleteSound.isEnabled = false
            saveSound.isEnabled = false
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
            
        } catch {
            finishRecording(success: false)
        }
        
    }
    
    @objc func updateLabel() {
        guard let audioRecorder = audioRecorder else { return }
        DispatchQueue.main.async {
            self.timerLabel.text = audioRecorder.currentTime.convertInterval()
        }
        
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        if success {
            tapToRecordLabel.text = "Tap to Re-record"
            recordButton.setImage(UIImage(named: "record"), for: .normal)
        } else {
            tapToRecordLabel.text = "Tap to Record"
            recordButton.setImage(UIImage(named: "record"), for: .normal)
        }
        
        recordButton.isEnabled = true
        playButton.isEnabled = true
        deleteSound.isEnabled = true
        saveSound.isEnabled = true
    }
    
    @IBAction func playAudioButtonTapped(_ sender: UIButton) {
        if (sender.titleLabel?.text == "Play"){
            recordButton.isEnabled = false
            sender.setTitle("Stop", for: .normal)
            sender.setImage(UIImage(named: "stop play"), for: .normal)
            preparePlayer()
            audioPlayer.play()
        } else if (sender.titleLabel?.text == "Stop Play"){
            audioPlayer.stop()
            sender.setTitle("Play", for: .normal)
            sender.setImage(UIImage(named: "play"), for: .normal)
            recordButton.isEnabled = true
        }
    }
    
    func preparePlayer() {
        var error: NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: getFileURL() as URL)
        } catch let error1 as NSError {
            error = error1
            audioPlayer = nil
        }
        if let err = error {
            print("AVAudioPlayer error: \(err.localizedDescription)")
        } else {
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 10.0
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func getFileURL() -> URL {
        let path = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        return path as URL
    }
    
    
    
    //MARK: To upload video on server
    func uploadAudioToServer() {
        /*Alamofire.upload(
         multipartFormData: { multipartFormData in
         multipartFormData.append(getFileURL(), withName: "audio.m4a")
         },
         to: "https://yourServerLink",
         encodingCompletion: { encodingResult in
         switch encodingResult {
         case .success(let upload, _, _):
         upload.responseJSON { response in
         Print(response)
         }
         case .failure(let encodingError):
         print(encodingError)
         }
         })*/
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //preview recording
    func playRecord() {
        
    }
    
    //save record to media
    func saveRecord() {
        delegate?.onDoneRecording(path: "path to video")
    }
    
    //delete record
    func deleteRecord() {
        
    }
    
    @IBAction func onRecording(_ sender: UIButton) {
        delegate?.onRecording(playerId: playerId ?? 0)
    }

    @IBAction func onDeleteRecord(_ sender: UIButton) {
        deleteRecord()
    }
    
    
    @IBAction func onDoneRecord(_ sender: UIButton) {
        saveRecord()
    }
}


extension RecordVC: AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print("Error while recording audio \(error!.localizedDescription)")
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordButton.isEnabled = true
        playButton.setTitle("Play", for: .normal)
        playButton.setImage(UIImage(named: "play"), for: .normal)
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("Error while playing audio \(error!.localizedDescription)")
    }
    
}
