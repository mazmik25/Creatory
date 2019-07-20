//
//  AlertViewPopUp.swift
//  Creatory
//
//  Created by Juansyah - on 18/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class AlertViewPopUp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    let VC = PreviewVC()
    let BVC = BaseVC()
    let pushPreview = PushPreview()
    var count = Preference.getInt(forKey: .badgesCount)
    
    //Outlets
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textOne: UILabel!
    @IBOutlet weak var textTwo: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func saveTap(_ sender: Any) {
        if textField.text != "" && textField.text != nil{
            dismiss(animated: true){
                self.count += 1
                let PVC = PreviewVC(nibName: "PreviewPage", bundle: nil)
                //Passing story title and counting to PreviewVC
                PVC.titleText = String(describing: self.textField.text)
                PVC.counting = self.count
                //Push to PreviewVC
                let pushVC = self.pushPreview.pushService()
                self.present(pushVC, animated: true)
                // Save entire story to Core Data
            }
        }else{
            textField.shake()
        }
    }
    
    @IBAction func cancelTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func commonInit(){
        alertView.changeView()
        saveButton.changeButton(title: "Save")
        cancelButton.changeButton(title: "Cancel")
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

//MARK: Extension
extension UIButton{
    func changeButton(title: String) {
        layer.cornerRadius = 20
        setTitle(title, for: .normal)
    }
}

extension UIView{
    func changeView() {
        layer.cornerRadius = 20
    }
}

extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}

