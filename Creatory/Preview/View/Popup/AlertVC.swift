//
//  AlertVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 21/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

protocol AlertVCDelegate: class {
    func onCancel()
    func onSave(title: String)
}

class AlertVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: AlertVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        alertView.applyBorder(width: 1.0, color: .clear, radius: .custom(12.0), withBounds: false)
        saveButton.applyBorder(width: 1.0, color: .white, radius: .custom(12.0), withBounds: true)
        cancelButton.applyBorder(width: 1.0, color: .white, radius: .custom(12.0), withBounds: true)
        
        textField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        mainView.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @IBAction func texfFieldChanged(_ sender: UITextField) {
        self.titleLabel.text = sender.text ?? ""
    }
    
    @IBAction func onSaveTapped(_ sender: UIButton) {
        if textField.text != "" && textField.text != nil {
            delegate?.onSave(title: self.titleLabel.text ?? "empty")
        } else{
            textField.shake()
        }
    }
    
    @IBAction func onCancelTapped(_ sender: UIButton) {
        delegate?.onCancel()
    }
}

extension AlertVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.titleLabel.isHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        self.titleLabel.isHidden = true
        return true
    }
}
