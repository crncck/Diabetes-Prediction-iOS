//
//  ViewController.swift
//  DiabetesPredictionApp
//
//  Created by Ceren Çiçek on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtGlucose: UITextField!
    @IBOutlet weak var txtPregnancies: UITextField!
    @IBOutlet weak var txtBMI: UITextField!
    @IBOutlet weak var lblPredictionResult: UILabel!

    var age : Double = 0.0
    var glucose : Double = 0.0
    var pregnancies : Double = 0.0
    var bmi : Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 0.702, green: 0.451, blue: 0.6902, alpha: 1.0).cgColor, UIColor(red: 0.4, green: 0.3451, blue: 0.6392, alpha: 1.0).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }

    @IBAction func btnPredictClicked(_ sender: Any) {

        age = (txtAge.text?.toDouble())!
        glucose = (txtGlucose.text?.toDouble())!
        pregnancies = (txtPregnancies.text?.toDouble())!
        bmi = (txtBMI.text?.toDouble())!

        predictDiabetes()
    }

    func predictDiabetes() {

        let model = diabetesPrediction()

        do {

            let prediction = try model.prediction(Pregnancies: pregnancies, Glucose: glucose, BMI: bmi, Age: age)

            if prediction.Outcome == 1 {

                lblPredictionResult.text = "You might have been in the prediabetes stage. Please see a doctor as soon as possible."

            } else {

                lblPredictionResult.text = "It seems like there is no high risk for diabetes but for detailed and healthier information please see a doctor."

            }


        } catch {

            lblPredictionResult.text = "Error"

        }

    }

}

extension String {

    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }

}


