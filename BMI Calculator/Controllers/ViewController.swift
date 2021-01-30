//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSlider.value = 1.5
        weightSlider.value = 100
        heightLabel.text = "\(String(format: "%.2f",heightSlider.value)) m"
        weightLabel.text = "\(Int(weightSlider.value)) kg"
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = "\(String(format: "%.2f", sender.value)) m"

    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(Int(sender.value)) kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
//    @IBAction func back(_ segue: UIStoryboardSegue){
//        
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController //cast to specify the data type of the destination segue
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
      
    }
}

