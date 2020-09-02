//
//  ViewController.swift
//  CalorieCalculator
//
//  Created by Alex Rodriguez on 8/20/20.
//  Copyright © 2020 Alex Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var WeightField: UITextField!
    
    @IBOutlet weak var DistanceField: UITextField!
    
    @IBOutlet weak var TimeField: UITextField!
    
    @IBOutlet weak var ResultsField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CalcuateCalories(_ sender: UIButton) {
        calculate()
    }
    
    var calculator = Calculator()
    
    
    func calculate() {
        var result = calculator.calculate(lbs: Float(WeightField.text!)!, dist: Float(DistanceField.text!)!, time: Float(TimeField.text!)!)
        let lowerbound = result.0
        let upperbound = result.1
        if lowerbound == upperbound {
            ResultsField.text = String(format: "About %.1f calories", lowerbound)
        } else {
            ResultsField.text = String(format: "%.1f calories - %.1f calories", upperbound, lowerbound)
        }
        
    }
    


}

