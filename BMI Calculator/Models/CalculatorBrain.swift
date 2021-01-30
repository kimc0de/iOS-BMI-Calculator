//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Kim on 29.01.21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
   
    mutating func calculateBMI(height: Float, weight: Float ){
        let value = weight/pow(height, 2)
        if value > 24.9{
            bmi = BMI(value: value, advice: "Please go easy on the snacks!", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }else if value > 18.5{
            bmi = BMI(value: value, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }else{
            bmi = BMI(value: value, advice: "Eat more pies!", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        }
      
    }
    func getBMIValue() -> String{
        let bmiFormat = String(format: "%.1f", bmi?.value ?? 0.0)
        return String(bmiFormat)
    }
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
}
