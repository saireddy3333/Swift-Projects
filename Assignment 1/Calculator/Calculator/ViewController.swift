//
//  ViewController.swift
//  Calculator
//
//  Created by Sai Shiva Reddy Kongari on 6/18/22.
//

import UIKit

class ViewController: UIViewController {

    var Result: String = ""
    @IBOutlet weak var FirstNumber: UITextField!
    @IBOutlet weak var SecondNumber: UITextField!
    @IBOutlet weak var sub: UIButton!
    @IBOutlet weak var SecondField: UITextField!
    @IBOutlet weak var Precisionfield: UITextField!
    
    @IBOutlet weak var Ans: UILabel!
    @IBOutlet weak var Integrateresult: UITextView!
    @IBOutlet weak var Upperfield: UITextField!
    @IBOutlet weak var Lowerfield: UITextField!
    @IBOutlet weak var prec: UILabel!
    @IBOutlet weak var upper: UILabel!
    @IBOutlet weak var lower: UILabel!
    @IBOutlet weak var Cfield: UITextField!
    @IBOutlet weak var Bfield: UITextField!
    @IBOutlet weak var Afield: UITextField!
    @IBOutlet weak var Integrate: UIButton!
    @IBOutlet weak var c: UILabel!
    @IBOutlet weak var b: UILabel!
    @IBOutlet weak var a: UILabel!
    @IBOutlet weak var Numerical: UILabel!
    @IBOutlet weak var power: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var div: UIButton!
    @IBOutlet weak var mul: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var Firstfield: UITextField!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var OptionCalculator: UISegmentedControl!
    @IBOutlet weak var Errormessage: UITextView!
    @IBOutlet weak var answer: UITextView!
    @IBOutlet weak var type: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func OptionCalculator(_ sender: UISegmentedControl) {
        if OptionCalculator.selectedSegmentIndex == 0{
            a.isHidden = true
            b.isHidden = true
            c.isHidden = true
            lower.isHidden = true
            upper.isHidden = true
            prec.isHidden = true
            Afield.isHidden = true
            Bfield.isHidden = true
            Cfield.isHidden = true
            Lowerfield.isHidden = true
            Upperfield.isHidden = true
            Precisionfield.isHidden = true
            Integrate.isHidden = true
            Integrateresult.isHidden = true
            Numerical.isHidden = true
        }else
        {
            if OptionCalculator.selectedSegmentIndex == 1{
                a.isHidden = false
                b.isHidden = false
                c.isHidden = false
                lower.isHidden = false
                upper.isHidden = false
                prec.isHidden = false
                Afield.isHidden = false
                Bfield.isHidden = false
                Cfield.isHidden = false
                Lowerfield.isHidden = false
                Upperfield.isHidden = false
                Precisionfield.isHidden = false
                Integrate.isHidden = false
                Integrateresult.isHidden = false
                Numerical.isHidden = false
                
                
            }
        }
    }
   
    @IBAction func Integrate(_ sender: UIButton) {
        if Upperfield.text != nil && Lowerfield.text != nil && Precisionfield.text != nil && Afield.text != nil && Bfield.text != nil && Cfield.text != nil {
        let valuea = Int(Afield.text!) ?? 0
        let valueb = Int(Bfield.text!) ?? 0
        let valuec = Int(Cfield.text!) ?? 0
        var low = Int(Lowerfield.text!) ?? 0
        let Upp = Int(Upperfield.text!) ?? 0
        let prec = Int(Precisionfield.text!) ?? 0
        var i = 0
        var area = 0
            area = area - (valuea * (low * low) + valueb * low + valuec) - ((valuea * (Upp * Upp) + valueb * Upp + valuec))
        while (low <= Upp)
        {
            i = (valuea * (low * low) + valueb * low + valuec)
            low = low + prec
            area = area + 2 * i
            
        }
            area =  (prec * area)
            area = area/2
        Integrateresult.text = "\(area)"
        
        }
    }
    //EXPONENTS
    @IBAction func Power(_ sender: UIButton) {
        if type.selectedSegmentIndex == 0{
            if FirstNumber.text != nil && SecondNumber.text != nil {
            let value1 = Int(FirstNumber.text!) ?? 0
            let value2 = Int(SecondNumber.text!) ?? 0
             let value3 = pow(Decimal(value1), value2)
                answer.text = "\(value3)"
                
        }
    }
    
        else if let value1 = (Double)(FirstNumber.text!){
        if let value2 = (Double)(SecondNumber.text!){
            let value3 = value1 / value2
            answer.text = String(value3)
        }else
        {
            print("Please enter the values for operation")
        }}
    }
    //PERCENTILE
    @IBAction func Percentage(_ sender: UIButton) {if type.selectedSegmentIndex == 0{
        if FirstNumber.text != nil && SecondNumber.text != nil {
        let value1 = (Int)(FirstNumber.text!) ?? 0
        let value2 = (Int)(SecondNumber.text!) ?? 0
            let value3 = (value1 % value2)
        answer.text = String(value3)
    }
}

    else if let value1 = (Double)(FirstNumber.text!){
    if let value2 = (Double)(SecondNumber.text!){
        Errormessage.text = String("This is not applicable to double type")
    }else
    {
        print("Please enter the values for operation")
    }}
    }
    //DIVISION FUNCTION
    @IBAction func Division(_ sender: Any) {
        if type.selectedSegmentIndex == 0{
            if FirstNumber.text != nil && SecondNumber.text != nil {
            let value1 = (Int)(FirstNumber.text!) ?? 0
            let value2 = (Int)(SecondNumber.text!) ?? 0
            let value3 = value1 / value2
            answer.text = String(value3)
        }
    }
    
        else if let value1 = (Double)(FirstNumber.text!){
        if let value2 = (Double)(SecondNumber.text!){
            let value3 = value1 / value2
            answer.text = String(value3)
        }else
        {
            print("Please enter the values for operation")
        }}
    }
    //MULTIPLICATION FUNCTION
    @IBAction func Multiplication(_ sender: UIButton) {
        if type.selectedSegmentIndex == 0{
            if FirstNumber.text != nil && SecondNumber.text != nil {
            let value1 = (Int)(FirstNumber.text!) ?? 0
            let value2 = (Int)(SecondNumber.text!) ?? 0
            let value3 = value1 * value2
            answer.text = String(value3)
        }
    }
    
        else if let value1 = (Double)(FirstNumber.text!){
        if let value2 = (Double)(SecondNumber.text!){
            let value3 = value1 * value2
            answer.text = String(value3)
        }else
        {
            print("Please enter the values for operation")
        }}
    }
    //SUBSTRACTION FUNC
    @IBAction func Substraction(_ sender: UIButton) {
        if type.selectedSegmentIndex == 0{
            if FirstNumber.text != nil && SecondNumber.text != nil {
            let value1 = (Int)(FirstNumber.text!) ?? 0
            let value2 = (Int)(SecondNumber.text!) ?? 0
            let value3 = value1 - value2
            answer.text = String(value3)
        }
    }
    
        else if let value1 = (Double)(FirstNumber.text!){
        if let value2 = (Double)(SecondNumber.text!){
            let value3 = value1 - value2
            answer.text = String(value3)
        }else
        {
            print("Please enter the values for operation")
        }
        
        
    }
    }
    //ADDITION FUNC
    @IBAction func Addition(_ sender: UIButton) {
        if type.selectedSegmentIndex == 0{
            if FirstNumber.text != nil && SecondNumber.text != nil {
            let value1 = (Int)(FirstNumber.text!) ?? 0
            let value2 = (Int)(SecondNumber.text!) ?? 0
            let value3 = value1 + value2
            answer.text = String(value3)
        }
    }
    
        else if let value1 = (Double)(FirstNumber.text!){
        if let value2 = (Double)(SecondNumber.text!){
            let value3 = value1 + value2
            answer.text = String(value3)
        }else
        {
            Errormessage.text = "Please enter the values for operation"
        }


        
        }
        
    }
    
}

