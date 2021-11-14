import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightOutput: UILabel!
    @IBOutlet weak var weightOutput: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var calculatorModel = CalculatorModel()

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
        
        calculatorModel.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.bmiValue = calculatorModel.getBMIValue()
            destinationVC.advice = calculatorModel.getAdvice()
            destinationVC.colour = calculatorModel.getColour()
        }
    }
}

