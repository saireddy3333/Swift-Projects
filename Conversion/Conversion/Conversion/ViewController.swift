//
//  ViewController.swift
//  Conversion
//
//  Created by Sai Shiva Reddy on 6/20/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var MaskValue: UILabel!
    @IBOutlet weak var MaskField1: UITextField!
    @IBOutlet weak var Stepper1: UIStepper!
    @IBOutlet weak var DecimalField: UITextView!
    @IBOutlet weak var OctalField: UITextView!
    @IBOutlet weak var HexaField: UITextView!
    @IBOutlet weak var BinaryField: UITextView!
    @IBOutlet weak var Reset: UIButton!
    
    @IBOutlet weak var Decimal: UILabel!
    
    @IBOutlet weak var Mask: UILabel!
    @IBOutlet weak var MaskField: UITextView!
    @IBOutlet weak var Binary: UILabel!
    @IBOutlet weak var HexaDecimal: UILabel!
    @IBOutlet weak var Octal: UILabel!
    @IBOutlet weak var Result: UIButton!
    @IBOutlet weak var OptionControl: UISegmentedControl!
    @IBOutlet weak var ShiftControl: UISegmentedControl!
    @IBOutlet weak var EnterNum: UILabel!
    @IBOutlet weak var NumberField: UITextField!
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var Picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Picker.delegate = self
        self.Picker.dataSource = self
        NumberField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }
    @objc func textFieldDidChange(_ textField: UITextField){
        self.Stepper.value = Double(NumberField.text!) ?? 0
    }
    @objc func textField1DidChange(_ textField: UITextField){
        self.Stepper1.value = Double(MaskField1.text!) ?? 0
    }

    @IBAction func OptionController(_ sender: UISegmentedControl) {
        if OptionControl.selectedSegmentIndex == 0{
            if list[selectedRow] == "Display in Binary"{
                IntToBinary()
            }
            else if list[selectedRow] == "Display in Octal"{
                IntToOctal()
            }else if list[selectedRow] == "Display in Decimal"{
                IntToDecimal()
            }else if list[selectedRow] == "Display in Hexadecimal"{
                IntToHexa()
            }}
    else if OptionControl.selectedSegmentIndex == 1{
            if list[selectedRow] == "Display in Binary"{
                OctalToBinary()
            }
            else if list[selectedRow] == "Display in Octal"{
                OctalToOctal()
            }else if list[selectedRow] == "Display in Decimal"{
                OctalToDecimal()
            }else if list[selectedRow] == "Display in Hexadecimal"{
                HexaToHexa()
            }
        }else if OptionControl.selectedSegmentIndex == 2{
            if list[selectedRow] == "Display in Binary"{
                HexaToBinary()
            }
            else if list[selectedRow] == "Display in Octal"{
                HexaToOctal()
            }else if list[selectedRow] == "Display in Decimal"{
                HexaToDecimal()
            }else if list[selectedRow] == "Display in Hexadecimal"{
                HexaToHexa()
            }
        }else if OptionControl.selectedSegmentIndex == 3{
            if list[selectedRow] == "Display in Binary"{
                BinaryToBinary()
            }
            else if list[selectedRow] == "Display in Octal"{
                BinaryToOctal()
            }else if list[selectedRow] == "Display in Decimal"{
                BinaryToDecimal()
            }else if list[selectedRow] == "Display in Hexadecimal"{
                BinaryToHexa()
            }
            
            
        }
    }
    // Result button
    @IBAction func Result(_ sender: Any) {
        if OptionControl.selectedSegmentIndex == 0{
            // Picker if Binary
            if list[selectedRow] == "Display in Binary"{
            IntToBinary()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            BinaryField.isHidden = false
            Binary.isHidden = false
                MaskField.isHidden = true
                Mask.isHidden = true
            //Picker if 
        }else if list[selectedRow] == "Display in Hexadecimal"{
            IntToHexa()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = false
            HexaField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
            
        }else if list[selectedRow] == "Display in Octal"{
            IntToOctal()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            OctalField.isHidden = false
            Octal.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
            
            
        }else if list[selectedRow] == "Display in Decimal"{
            IntToDecimal()
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            Decimal.isHidden = false
            DecimalField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
        }
            else if list[selectedRow] == "Display All Conversions"{
                IntToHexa()
                IntToDecimal()
                IntToBinary()
                OctalToOctal()
                Decimal.isHidden = false
                DecimalField.isHidden = false
                OctalField.isHidden = false
                Octal.isHidden = false
                BinaryField.isHidden = false
                Binary.isHidden = false
                HexaDecimal.isHidden = false
                HexaField.isHidden = false
                MaskField.isHidden = true
                Mask.isHidden = true
            }
            else if list[selectedRow] == "Left Shift"{
                if Int(NumberField.text!) != nil{
                    BinaryField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 10))! << 1), radix: 2))
                    HexaField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 10))! << 1), radix: 16))
                    OctalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 10))! << 1), radix: 8))
                    DecimalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 10))! << 1), radix: 10))
                    
                }
            }
            else if list[selectedRow] == "Right Shift"{
                if Int(NumberField.text!) != nil{
                    BinaryField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 10))! >> 1), radix: 2))
                    HexaField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 10))! >> 1), radix: 16))
                    OctalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 10))! >> 1), radix: 8))
                    DecimalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 10))! >> 1), radix: 10))
                    
                }
            }
            
        }
        if OptionControl.selectedSegmentIndex == 1{
            if list[selectedRow] == "Display in Binary"{
            OctalToBinary()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            BinaryField.isHidden = false
            Binary.isHidden = false
                MaskField.isHidden = true
                Mask.isHidden = true
            
        }else if list[selectedRow] == "Display in Hexadecimal"{
            OctalToHexadecimal()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = false
            HexaField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
            
        }else if list[selectedRow] == "Display in Octal"{
            OctalToOctal()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            OctalField.isHidden = false
            Octal.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
            
            
        }else if list[selectedRow] == "Display in Decimal"{
            OctalToDecimal()
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            Decimal.isHidden = false
            DecimalField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
        }else if list[selectedRow] == "Display All Conversions"{
            OctalToHexadecimal()
            OctalToDecimal()
            OctalToBinary()
            OctalToOctal()
            Decimal.isHidden = false
            DecimalField.isHidden = false
            OctalField.isHidden = false
            Octal.isHidden = false
            BinaryField.isHidden = false
            Binary.isHidden = false
            HexaDecimal.isHidden = false
            HexaField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
        }
            else if list[selectedRow] == "Left Shift"{
                if Int(NumberField.text!) != nil{
                    BinaryField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 8))! << 1), radix: 2))
                    HexaField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 8))! << 1), radix: 16))
                    OctalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 8))! << 1), radix: 8))
                    DecimalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 8))! << 1), radix: 10))
                    
                }
            }
            else if list[selectedRow] == "Right Shift"{
                if Int(NumberField.text!) != nil{
                    BinaryField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 8))! >> 1), radix: 2))
                    HexaField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 8))! >> 1), radix: 16))
                    OctalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 8))! >> 1), radix: 8))
                    DecimalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 8))! >> 1), radix: 10))
                    
                }
            }
            
        }
        if OptionControl.selectedSegmentIndex == 2{
            if list[selectedRow] == "Display in Binary"{
            HexaToBinary()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            BinaryField.isHidden = false
            Binary.isHidden = false
                MaskField.isHidden = true
                Mask.isHidden = true
            
        }else if list[selectedRow] == "Display in Hexadecimal"{
            HexaToHexa()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = false
            HexaField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
            
        }else if list[selectedRow] == "Display in Octal"{
            HexaToOctal()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            OctalField.isHidden = false
            Octal.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
            
            
        }else if list[selectedRow] == "Display in Decimal"{
            HexaToDecimal()
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            Decimal.isHidden = false
            DecimalField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
        }
            else if list[selectedRow] == "Display All Conversions"{
                HexaToHexa()
                HexaToDecimal()
                HexaToBinary()
                HexaToOctal()
                Decimal.isHidden = false
                DecimalField.isHidden = false
                OctalField.isHidden = false
                Octal.isHidden = false
                BinaryField.isHidden = false
                Binary.isHidden = false
                HexaDecimal.isHidden = false
                HexaField.isHidden = false
                MaskField.isHidden = true
                Mask.isHidden = true
            }
            else if list[selectedRow] == "Left Shift"{
                if Int(NumberField.text!) != nil{
            
                    BinaryField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 16))! << 1), radix: 2))
                    HexaField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 16))! << 1), radix: 16))
                    OctalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 16))! << 1), radix: 8))
                    DecimalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 16))! << 1), radix: 10))
                    
                }
            }
            else if list[selectedRow] == "Right Shift"{
                if Int(NumberField.text!) != nil{
                    BinaryField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 16))! >> 1), radix: 2))
                    HexaField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 16))! >> 1), radix: 16))
                    OctalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 16))! >> 1), radix: 8))
                    DecimalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 16))! >> 1), radix: 10))
                    
                }
            }
        }
        if OptionControl.selectedSegmentIndex == 3{
            if list[selectedRow] == "Display in Binary"{
            BinaryToBinary()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            BinaryField.isHidden = false
            Binary.isHidden = false
                MaskField.isHidden = true
                Mask.isHidden = true
            
        }else if list[selectedRow] == "Display in Hexadecimal"{
            BinaryToHexa()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = false
            HexaField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
            
        }else if list[selectedRow] == "Display in Octal"{
            BinaryToOctal()
            Decimal.isHidden = true
            DecimalField.isHidden = true
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            OctalField.isHidden = false
            Octal.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
            
            
        }else if list[selectedRow] == "Display in Decimal"{
            BinaryToDecimal()
            BinaryField.isHidden = true
            Binary.isHidden = true
            HexaDecimal.isHidden = true
            HexaField.isHidden = true
            OctalField.isHidden = true
            Octal.isHidden = true
            Decimal.isHidden = false
            DecimalField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
        }
        else if list[selectedRow] == "Display All Conversions"{
            BinaryToHexa()
            BinaryToDecimal()
            BinaryToBinary()
            BinaryToOctal()
            Decimal.isHidden = false
            DecimalField.isHidden = false
            OctalField.isHidden = false
            Octal.isHidden = false
            BinaryField.isHidden = false
            Binary.isHidden = false
            HexaDecimal.isHidden = false
            HexaField.isHidden = false
            MaskField.isHidden = true
            Mask.isHidden = true
        }
            else if list[selectedRow] == "Left Shift"{
                if Int(NumberField.text!) != nil{
            
                    BinaryField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 2))! << 1), radix: 2))
                    HexaField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 2))! << 1), radix: 16))
                    OctalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 2))! << 1), radix: 8))
                    DecimalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 2))! << 1), radix: 10))
                    
                }
            }
            else if list[selectedRow] == "Right Shift"{
                if Int(NumberField.text!) != nil{
                    BinaryField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 2))! >> 1), radix: 2))
                    HexaField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 2))! >> 1), radix: 16))
                    OctalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 2))! >> 1), radix: 8))
                    DecimalField.text = String(String(Int(Int(String(Int(NumberField.text!)!, radix: 2))! >> 1), radix: 10))
                    
                }
            }
        }}
    func OctalToBinary()
    {
        if NumberField.text != nil{
//            let a = (Int8)(NumberField.text!) ?? 0
//            let b = String(a, radix: 8)!
            BinaryField.text = String(Int(String(NumberField.text!), radix: 8)!, radix: 2)
            
        }}
        func OctalToDecimal()
        {
            if NumberField.text != nil{
            //    let a = (Int8)(NumberField.text!) ?? 0
                DecimalField.text = String(Int(String(NumberField.text!), radix: 8)!, radix: 10)
            }}
            func OctalToHexadecimal()
            {
                if NumberField.text != nil{
                  //  let a = (Int8)(NumberField.text!) ?? 0
                    HexaField.text = String(Int(String(NumberField.text!), radix: 8)!, radix: 16)
                }}
                func OctalToOctal()
                {
                    if NumberField.text != nil{
                      //  let a = (Int8)(NumberField.text!) ?? 0
                        OctalField.text = String(Int(String(NumberField.text!), radix: 8)!, radix: 8)
                }
                }
        func HexaToBinary()
                    {
      if NumberField.text != nil{
          //let a = (Int16)(NumberField.text!) ?? 0
          BinaryField.text = String(Int(String(NumberField.text!), radix: 16)!, radix: 2)
      }}
                        
       func HexaToDecimal()
       {
      if NumberField.text != nil{
   // let a = (Int16)(NumberField.text!) ?? 0
          DecimalField.text = String(Int(String(NumberField.text!), radix: 16)!, radix: 10)
      }}
     func HexaToOctal()
    {
    if NumberField.text != nil{
       // let a = (Int16)(NumberField.text!) ?? 0
        OctalField.text = String(Int(String(NumberField.text!), radix: 16)!, radix: 8)
    }}
    
    func HexaToHexa()
                {
       if NumberField.text != nil{
      //  let a = (Int16)(NumberField.text!) ?? 0
       HexaField.text = String(Int(String(NumberField.text!), radix: 16)!, radix: 16)
       }}
    
    func BinaryToDecimal()
    {
        if NumberField.text != nil{
        // let a = (Int)(NumberField.text!) ?? 0
            DecimalField.text = String(Int(String(NumberField.text!), radix: 2)!, radix: 10)
        }}
    func BinaryToOctal()
    {
        if NumberField.text != nil{
        // let a = (Int)(NumberField.text!) ?? 0
        OctalField.text = String(Int(String(NumberField.text!), radix: 2)!, radix: 8)
        }}
    func BinaryToHexa()
    {
        if NumberField.text != nil{
        // let a = (Int)(NumberField.text!) ?? 0
            HexaField.text = String(Int(String(NumberField.text!), radix: 2)!, radix: 16)
        }}
    func BinaryToBinary()
    {
        if NumberField.text != nil{
        // let a = (Int)(NumberField.text!) ?? 0
        BinaryField.text = String(Int(String(NumberField.text!), radix: 2)!, radix: 2)
        }}
        
    
    func IntToBinary()
    {
        if NumberField.text != nil{
            let a = (Int)(NumberField.text!) ?? 0
            BinaryField.text = String(a, radix: 2)
            }
    }
    
    func IntToOctal()
    {
        if NumberField.text != nil{
            let a = (Int)(NumberField.text!) ?? 0
                OctalField.text = String(a, radix: 8)
            
        }
    }
    
    func IntToHexa()
    {
        if NumberField.text != nil{
            let a = (Int)(NumberField.text!) ?? 0
            HexaField.text = String(a, radix: 16)
        }
    }
    func IntToDecimal()
    {
        if NumberField.text != nil{
            let a = (Double)(NumberField.text!) ?? 0
            let b = (Double)(a / 1000000.0)
            DecimalField.text = String(b)
        }
    }
    
    @IBAction func Stepper1(_ sender: Any) {
        MaskField1.text = "\(Int(Stepper1.value))"
        
    }
    @IBAction func Stepper(_ sender: Any) {
        NumberField.text = "\(Int(Stepper.value))"
        
    }
    @IBAction func OptionControl(_ sender: UISegmentedControl) {
        if OptionControl.selectedSegmentIndex == 0 {
            
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }
    
    
var list = ["Select","Display in Decimal","Display in Octal", "Display in Hexadecimal", "Display in Binary","Display All Conversions","Left Shift","Right Shift","Mask"]
    var selectedRow : Int = 0
    }


