//
//  TransactionDBModel.swift
//  ATM Machine
//
//  Created by Kongari, Sai Shiva Reddy on 7/1/22.
//

import UIKit

class TransactionDBModel {

    var database:[Database]
    
    init(){
        database = [Database]()
        
    }
    
    func io(_ Operationtype:String, _ DateDetails:String, _ TotalAmount:String){
        self.database.append(Database(Operationtype, DateDetails, TotalAmount))
    }
    
    func dataAtIndex (_ idx: Int) -> Database{
        return database[idx]
        
    }
    func deleteDataAtIndex(_ idx: Int){
        database.remove(at: idx)
    }
    func count()-> Int{
        return database.count
    }
    func addData(_ d:Database){
        database.append(d)
    }
}
