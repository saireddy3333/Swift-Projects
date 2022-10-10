//
//  FinalViewController.swift
//  ATM Machine
//
//  Created by Kongari, Sai Shiva Reddy on 7/1/22.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var TotalField: UITextField!
    @IBOutlet weak var DateField: UITextField!
    @IBOutlet weak var OpField: UITextField!
    
    var FinalData:Database!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        FinalData = Database(OpField.text!, DateField.text!, TotalField.text!)
    }
    

}
