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
    
    private func save(){ //Сохранение Данных в БД
        do {
            try self.context.save()
        }
        catch  {/*Добавить вывод ошибки*/}
    }
    
    func delete(dataForRemove:NSManagedObject){ //Удаление данных из БД
        self.context.delete(dataForRemove)
        self.save()
    }
    
    func create(createNewObject: ()->()) { //Создание новой записи в БД
        createNewObject()
        save()
    }
    
    func update(){ //Обновление записи из БД
            
    }
    
    func get(handler: ()->()) -> [Comments]{ //Получение всех записей из БД
        do {
            let tempData:[Comments] = try context.fetch(Comments.fetchRequest())
            handler()
            return tempData
        }
        catch {
            return []
        }
    }
}

