//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightOutput: UILabel!
    @IBOutlet weak var weightOutput: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightOutput.text = "\(String(round(sender.value * 100)/100)) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let kilos = Int(sender.value)
        
        weightOutput.text = "\(String(kilos))  kg"
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let height = heightSlider.value // m
        let weight = weightSlider.value // kg
        
        let bmi = weight / pow(height, 2)
        print(bmi)
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.1f", bmi)
        
        self.present(secondVC, animated: true, completion: nil)
    }
    
}

