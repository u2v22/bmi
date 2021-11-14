import UIKit

struct CalculatorModel {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let formatBMI = String(format: "%.1f", bmi?.value ?? "0.0")
        
        return formatBMI
    } 
    
    func getColour() -> UIColor {
        return bmi?.colour ?? UIColor.white
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Default string"
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue =  weight / pow(height, 2)
        
        if(bmiValue < 18.5){
            bmi = BMI(colour: UIColor.blue, value: bmiValue, advice: "Eat more pie")
        } else if (bmiValue < 24.9){
            bmi = BMI(colour: UIColor.green, value: bmiValue, advice: "Fit as a fiddle")
        } else {
            bmi = BMI(colour: UIColor.purple, value: bmiValue, advice: "Eat less pies")
        }
    }
}
