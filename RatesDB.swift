//
//  WorkWithDB.swift
//  KinoRate
//
//  Created by Садык Мусаев on 20.02.2021.
//

import CoreData
import UIKit

class RatesDB{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private func save(){
        do {
            try self.context.save()
        } catch  {/*Добавить вывод ошибки*/}
    }
    
    func delete(dataForRemove:NSManagedObject){
        self.context.delete(dataForRemove)
        self.save()
    }
    
    func create(createNewObject: ()->()) {
        save()
    }
    
    func update(){
            
    }
    
    func get(handler: ()->()) -> [Comments]{
        do {
            let tempData:[Comments] = try context.fetch(Comments.fetchRequest())
            handler()
            return tempData
        } catch {
            return []
        }
    }
    
}
