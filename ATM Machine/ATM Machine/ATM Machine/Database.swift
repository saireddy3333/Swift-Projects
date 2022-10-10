//
//  DATABASE.swift
//  ATM Machine
//
//  Created by Kongari, Sai Shiva Reddy on 7/1/22.
//

import UIKit

class Database{
    
    var Operationtype: String
    var DateDetails: String
    var TotalAmount: String
    
    init(_ Operationtype: String, _ DateDetails: String,_ TotalAmount: String){
        self.Operationtype = Operationtype
        self.DateDetails = DateDetails
        self.TotalAmount = TotalAmount
    }
    func date()-> String{
        return DateDetails}
}
