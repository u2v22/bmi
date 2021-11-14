import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValue: String?
    var colour: UIColor?
    var advice: String?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        view.backgroundColor = colour
        adviceLabel.text = advice
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
