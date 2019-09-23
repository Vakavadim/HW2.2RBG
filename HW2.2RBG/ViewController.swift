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
    
    
    var redColorRaw: CGFloat = 1.0
    var greenColorRaw: CGFloat = 0.5
    var blueColorRaw: CGFloat = 0.5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColorLabel.text = roundRaw(volume: CGFloat(redSlider.value))
        greenColorLabel.text = roundRaw(volume: CGFloat(greenSlider.value))
        blueColorLabel.text = roundRaw(volume: CGFloat(blueSlider.value))

        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1

        
    }
    
    // метод изменения цвета view
    private func changeBackgraundColor() {
        let viewBackgroundColor = UIColor(red: redColorRaw, green: greenColorRaw, blue: blueColorRaw, alpha: 1)
        colorView.backgroundColor = viewBackgroundColor
    }
    
    
    // метод округления до сотых
    func roundRaw(volume: CGFloat) -> (String) {
        let roundVolume = Double(round(100*volume)/100)
        return String(roundVolume)
    }

    @IBAction func redVoulmeSlider(_ sender: UISlider) {
        let redRow = CGFloat(sender.value)
        self.redColorRaw = redRow
        self.redColorLabel.text = roundRaw(volume: redRow)
        changeBackgraundColor()
    }
    @IBAction func greenVoulmeSlider(_ sender: UISlider) {
        let greenRaw = CGFloat(sender.value)
        self.greenColorRaw = greenRaw
        self.greenColorLabel.text = roundRaw(volume: greenRaw)
        changeBackgraundColor()
    }
    @IBAction func blueVoulmeSlider(_ sender: UISlider) {
        let blueRaw = CGFloat(sender.value)
        self.blueColorRaw = blueRaw
        self.blueColorLabel.text = roundRaw(volume: blueRaw)
        changeBackgraundColor()
    }
    
    
}

