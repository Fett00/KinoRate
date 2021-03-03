//
//  WorkWithDB.swift
//  KinoRate
//
//  Created by Садык Мусаев on 20.02.2021.
//

import CoreData
import UIKit

class WorkWithDB{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private func save(){
        do {
            try self.context.save()
        } catch  {}
    }
    
    func deleteFromDB(){
        
    }
    
    func saveInDB(){
        
    }
    func updateInDB(){
            
    }
}
