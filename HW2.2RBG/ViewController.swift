//
//  ViewController.swift
//  HW2.2RBG
//
//  Created by Вадим Гамзаев on 23/09/2019.
//  Copyright © 2019 Вадим Гамзаев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redColorTextField: UITextField!
    @IBOutlet weak var greenColorTextField: UITextField!
    @IBOutlet weak var blueColorTextField: UITextField!
    
    
    
    var redColorRaw: CGFloat = 1.0
    var greenColorRaw: CGFloat = 0.5
    var blueColorRaw: CGFloat = 0.5
    
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = colorView.frame.height / 5.0
        
        setupSliders()
        addDoneButtonOnKeyboard()
        changePad()
        startVoulemLable()
        startVoulemFields()
        

        
    }
    
    // метод изменения цвета view слайдером
    private func changeBackgraundColor() {
        let viewBackgroundColor = UIColor(red: redColorRaw, green: greenColorRaw, blue: blueColorRaw, alpha: 1)
        colorView.backgroundColor = viewBackgroundColor
    }
    
        // метод изменения цвета view через textField
    private func changeByDoneButton() {
        
        guard let redColorTextFieldRaw = Float(redColorTextField.text!) else { return }
        guard let greenColorTextFieldRaw = Float(greenColorTextField.text!) else { return }
        guard let blueTextFieldRaw = Float(blueColorTextField.text!) else { return }
    
        
        redSlider.value = redColorTextFieldRaw
        greenSlider.value = greenColorTextFieldRaw
        blueSlider.value = blueTextFieldRaw
        
        
        redColorLabel.text = String(redColorTextFieldRaw)
        greenColorLabel.text = String(greenColorTextFieldRaw)
        blueColorLabel.text = String(blueTextFieldRaw)
        
        let viewBackgroundColor = UIColor(red: CGFloat(redColorTextFieldRaw), green: CGFloat(greenColorTextFieldRaw), blue: CGFloat(blueTextFieldRaw), alpha: 1)
        colorView.backgroundColor = viewBackgroundColor
    }
    
    // метод настройки слайдеров
    private func setupSliders() {
        let sliders = [redSlider, greenSlider, blueSlider]
        for slider in sliders {
            slider?.minimumValue = 0
            slider?.maximumValue = 1
        }
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    
    // метод округления до сотых
    private func roundRaw(volume: CGFloat) -> (String) {
        let roundVolume = Double(round(100*volume)/100)
        return String(roundVolume)
    }
    
    
    // начальное значение в лэйблах
    private func startVoulemLable() {
        let colorLabelAndSliders = [redColorLabel: redSlider, greenColorLabel: greenSlider, blueColorLabel: blueSlider]
        for (label, slider) in colorLabelAndSliders {
            label?.text = roundRaw(volume: CGFloat(slider!.value))
        }
    }
    
    // начальное значение в филд
    private func startVoulemFields() {
        let colorLabelAndSliders = [redColorTextField: redSlider, greenColorTextField: greenSlider, blueColorTextField: blueSlider]
        for (field, slider) in colorLabelAndSliders {
            field?.text = roundRaw(volume: CGFloat(slider!.value))
        }
    }

    
    
    
    @IBAction func redVoulmeSlider(_ sender: UISlider) {
        let redRow = CGFloat(sender.value)
        self.redColorRaw = redRow
        self.redColorLabel.text = roundRaw(volume: redRow)
        self.redColorTextField.text = roundRaw(volume: redRow)
        changeBackgraundColor()
    }
    @IBAction func greenVoulmeSlider(_ sender: UISlider) {
        let greenRaw = CGFloat(sender.value)
        self.greenColorRaw = greenRaw
        self.greenColorLabel.text = roundRaw(volume: greenRaw)
        self.greenColorTextField.text = roundRaw(volume: greenRaw)
        changeBackgraundColor()
    }
    @IBAction func blueVoulmeSlider(_ sender: UISlider) {
        let blueRaw = CGFloat(sender.value)
        self.blueColorRaw = blueRaw
        self.blueColorLabel.text = roundRaw(volume: blueRaw)
        self.blueColorTextField.text = roundRaw(volume: blueRaw)
        changeBackgraundColor()
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeByDoneButton()
        self.view.endEditing(true)
    }
    
    private func changePad() {
        let textFields = [redColorTextField, greenColorTextField, blueColorTextField]
        for textField in textFields {
            textField?.keyboardType = UIKeyboardType.decimalPad
        }
    }

    private func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        redColorTextField.inputAccessoryView = doneToolbar
        greenColorTextField.inputAccessoryView = doneToolbar
        blueColorTextField.inputAccessoryView = doneToolbar
    }
    

    @objc func doneButtonAction(){
        changeByDoneButton()
        self.view.endEditing(true)

    }
    
}

