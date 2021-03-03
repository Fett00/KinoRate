//
//  Comments+CoreDataProperties.swift
//  KinoRate
//
//  Created by Садык Мусаев on 01.03.2021.
//
//

import Foundation
import CoreData


extension Comments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comments> {
        return NSFetchRequest<Comments>(entityName: "Comments")
    }

    @NSManaged public var comment: String?
    @NSManaged public var filmID: String?
    @NSManaged public var userID: String?
    @NSManaged public var id: String?
    @NSManaged public var rating: Int32

}

extension Comments : Identifiable {

}
