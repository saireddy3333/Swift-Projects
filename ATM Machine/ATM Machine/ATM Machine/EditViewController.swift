//
//  EditViewController.swift
//  ATM Machine
//
//  Created by Kongari, Sai Shiva Reddy on 7/1/22.
//

import UIKit

class EditViewController: UIViewController {

    var fData:Database!
    
    @IBOutlet weak var TotalAmountField: UITextField!
    @IBOutlet weak var DDetailsField: UITextField!
    @IBOutlet weak var OperationTypeField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
        TotalAmountField.text = fData.TotalAmount
        DDetailsField.text = fData.DateDetails
        OperationTypeField.text = fData.Operationtype
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
