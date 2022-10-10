//
//  TransactionViewController.swift
//  ATM Machine
//
//  Created by Kongari, Sai Shiva Reddy on 7/1/22.
//

import UIKit

class TransactionViewController: UITableViewController {

    var Transaction: TransactionDBModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Transactions"
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return Transaction.count()
       
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TransactionIdentifier = "TransactionCell"
        //Check to see if a reusable cell exists first and use it
        //this will put fewer demands on memory
        let cell =
            tableView.dequeueReusableCell(withIdentifier:
                TransactionIdentifier, for: indexPath)
            let Transactions = Transaction.dataAtIndex(indexPath.row)
        cell.textLabel!.text = Transactions.DateDetails
            return cell

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Trans", sender: self)
    }

    @IBAction func add(segue: UIStoryboardSegue){
        if segue.identifier == "AddSegue"{
            let AddData = segue.source as! FinalViewController
            Transaction.addData(AddData.FinalData)
            tableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier{
            switch id{
            case "Trans":
                if let trans = segue.destination as? EditViewController{
                    let selectRow = self.tableView.indexPathForSelectedRow?.row
                    trans.fData = Transaction.dataAtIndex(selectRow!)
                }
            default :
                break
            }
        }
    }
}
