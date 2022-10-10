//
//  MainPageViewController.swift
//  ATM Machine
//
//  Created by Kongari, Sai Shiva Reddy on 6/28/22.
//

import UIKit
import Foundation

class MainPageViewController: UIViewController {
    
    //var type of bank balance with zero balance
    var BankBalance:Double = 0.0
    var bData: TransactionDBModel!
    var aData: Database!
    var dateformat = DateFormatter()
    var counter: Int = 0
    //
    @IBOutlet weak var DisplayMessage: UILabel!
    @IBOutlet weak var AmountField: UITextField!
   
    @IBOutlet weak var date: UILabel!
    @IBAction func Balance(_ sender: Any) {
        DisplayMessage.text = String("Bank Balance is $: \(BankBalance)")
    }
// Withdraw button action to perform withdraw operation
    @IBAction func Withdraw(_ sender: Any) {
        if let withdraw =  (Double)(AmountField.text!){
            if withdraw > BankBalance{
                AmountField.text = ""
                DisplayMessage.text = String("Not enough funds to withdraw")
            }else if withdraw > 0 {
                BankBalance = BankBalance - withdraw
                AmountField.text = ""
            DisplayMessage.text = String("Withdraw Amount $: \(withdraw) Balance:\(BankBalance)")
                let CurrentDate = Date()
                let Format = DateFormatter()
                Format.timeZone = .current
                Format.locale = .current
                Format.dateFormat = "MM-dd-yyyy HH:mm"
                date.text = Format.string(from: CurrentDate)
               bData.io("Withdraw", date.text!, "\(withdraw)")
            }else{
                AmountField.text = ""
                DisplayMessage.text = String("Cannot Withdraw Negative Amount")
            }
        }}
        // Deposit button action to perform deposit operation
    @IBAction func Deposit(_ sender: Any) {
        if let dep = (Double)(AmountField.text!){
            if dep > 100000 {
                AmountField.text = ""
                DisplayMessage.text = String("You are not authorized for this transaction")
            }else if dep > 0{
            BankBalance = BankBalance + dep
                AmountField.text = ""
            DisplayMessage.text = String("Deposit Amount $: \(dep) Balance:\(BankBalance)")
                let CurrentDate = Date()
                let Format = DateFormatter()
                Format.timeZone = .current
                Format.locale = .current
                Format.dateFormat = "MM-dd-yyyy HH:mm"
                date.text = Format.string(from: CurrentDate)
               bData.io("Deposit", date.text!,"\(dep)")
            }else{
                AmountField.text = ""
                DisplayMessage.text = String("Cannot Add negative Amount")
            }
        }}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier{
            switch id{
            case "TransactionView":
                let TransactionV = segue.destination as! TransactionViewController
                TransactionV.Transaction = bData
            default :
                break
            }
        }
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    bData = TransactionDBModel()
    // Do any additional setup after loading the view.
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

