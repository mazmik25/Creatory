//
//  RecordVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 19/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import AVKit

protocol RecordVCDelegate: class {
    func onRecording(playerId: Int)
    func onDoneRecording(path: String)
}

class RecordVC: UIViewController {

    @IBOutlet weak var tapToRecordLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    weak var delegate: RecordVCDelegate?
    var playerId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //setup recording
    func setupRecord() {
        
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
    
    @IBAction func onPlayRecord(_ sender: UIButton) {
        playRecord()
    }
    
    @IBAction func onDoneRecord(_ sender: UIButton) {
        saveRecord()
    }
}
