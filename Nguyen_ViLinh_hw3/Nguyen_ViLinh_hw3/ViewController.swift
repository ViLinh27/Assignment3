//
//  ViewController.swift
//  Nguyen_ViLinh_hw3
//
//  Created by Vi-Linh Nguyen on 1/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resLabel: UILabel!
    
    //helps connect num button vals to actual num val
    var numOnScreen: Double = 0;
    var prevNum: Double = 0;
    var doMath = false;
    var operation = 0;
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //display num buttons on label when pressed:
        if doMath == true {
            resLabel.text = String(sender.tag-1)
            numOnScreen = Double(resLabel.text!)!
            doMath = false
        }
        else {
            resLabel.text = resLabel.text! + String(sender.tag-1)
            numOnScreen = Double(resLabel.text!)!
        }
    }
    
    @IBAction func mathButtonPressed(_ sender: UIButton) {
        //the math operations
        if resLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            prevNum = Double(resLabel.text!)!
            if sender.tag == 15 {
                //addition
                resLabel.text = "+";
            }
            else if sender.tag == 14 {
                //subtraction
                resLabel.text = "-";
            }
            else if sender.tag == 13{
                //multiplication
                resLabel.text = "*";
            }
            else if sender.tag == 12 {
                //division
                resLabel.text = "/";
            }
            operation = sender.tag
            doMath = true;
        }
        else if sender.tag == 16 {//finish math
            if operation == 15 {
                //addition
                resLabel.text = String(prevNum + numOnScreen)
            }
            else if operation == 14 {
                //subract
                resLabel.text = String(prevNum - numOnScreen)
            }
            else if operation == 13 {
                //multiply
                resLabel.text = String(prevNum * numOnScreen)
            }
            else if operation == 12 {
                //divide
                resLabel.text = String(prevNum / numOnScreen)
            }
        }
        else if sender.tag == 11 {
            //clear button
            resLabel.text = ""
            prevNum = 0;
            numOnScreen = 0;
            operation = 0;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

