//
//  ViewController.swift
//  ATM Machine
//
//  Created by Kongari, Sai Shiva Reddy on 6/27/22.
//

import UIKit

class HomeViewController: UIViewController {
// Login button operation
    @IBAction func Login(_ sender: UIButton) {
        if PasswordField.text == "2531" {
            ErrorMessage.isHidden = true
            let mainpage = self.storyboard?.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
            self.navigationController?.pushViewController(mainpage, animated: true)
        }
        else if PasswordField.text != "2531"{
            ErrorMessage.text = "Invalid Password"
        }else {
            ErrorMessage.text = "Enter password to login"}}
        
        
    @IBOutlet weak var ErrorMessage: UILabel!
    @IBOutlet weak var PasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

