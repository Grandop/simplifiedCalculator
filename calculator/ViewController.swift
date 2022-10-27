//
//  ViewController.swift
//  calculator
//
//  Created by Pedro Grando on 25/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingCalc = false
    var signalOfOperation = 0
    
    @IBOutlet weak var labelOnDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingCalc == true {
            labelOnDisplay.text = String(sender.tag)
            numberOnScreen = Double(labelOnDisplay.text!)!
            performingCalc = false
        } else {
            labelOnDisplay.text! += String(sender.tag)
            numberOnScreen = Double(labelOnDisplay.text!)!
        }
        
    }
    
    @IBAction func buttonsOfOperations(_ sender: UIButton) {
        
        if labelOnDisplay.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(labelOnDisplay.text!)!
            
            if sender.tag == 12 { //Divide
                labelOnDisplay.text = "÷";
            }
            if sender.tag == 13 { //Multiply
                labelOnDisplay.text = "x";
            }
            if sender.tag == 14 { //Subtract
                labelOnDisplay.text = "-";
            }
            if sender.tag == 15 { //Add
                labelOnDisplay.text = "+";
            }
            if sender.tag == 21 { //Potency
                labelOnDisplay.text = "ˆ"
            }
            if sender.tag == 22{ //Percent
                labelOnDisplay.text = "%"
            }
            
            signalOfOperation = sender.tag
            performingCalc = true
            
        } else if sender.tag == 16 {

            if signalOfOperation == 12 { //Divide
                labelOnDisplay.text = String(previousNumber / numberOnScreen)
            } else if signalOfOperation == 13 { //Multiply
                labelOnDisplay.text = String(previousNumber * numberOnScreen)
            } else if signalOfOperation == 14 { //Subtract
                labelOnDisplay.text = String(previousNumber - numberOnScreen)
            } else if signalOfOperation == 15 { //Add
                labelOnDisplay.text = String(previousNumber + numberOnScreen)
            } else if signalOfOperation == 21 { //Potency
                labelOnDisplay.text = String(pow(previousNumber, numberOnScreen))
            } else if signalOfOperation == 22 { //Percent
                labelOnDisplay.text = String((previousNumber * numberOnScreen) / 100)
            }
            
        } else if sender.tag == 11 {
            labelOnDisplay.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            signalOfOperation = 0;

        }
    }
    
    @IBAction func addDotDecimal(_ sender: UIButton) {
        if performingCalc || labelOnDisplay.text!.isEmpty
            {
            labelOnDisplay.text = "0."
            performingCalc = false
            }
            else
            {
                if !labelOnDisplay.text!.contains(".") {
                    labelOnDisplay.text! +=  "."
                }
            }
            numberOnScreen = Double(labelOnDisplay.text!)!
        }
    }
    

    
    
    

