//
//  ItemCD.swift
//  closet
//
//  Created by admin on 2021/3/27.
//


import Foundation
import CoreData

enum ItemCDSort: String {
    case createdAt
    case updatedAt
    case buyOn
}

enum ItemCDFilterTime: String {
    case all
    case week
    case month
}

public class ItemCD: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var category: String?
    @NSManaged public var title: String?
    @NSManaged public var buyOn: Date?
    @NSManaged public var note: String?
    @NSManaged public var amount: Double
    @NSManaged public var imageAttached: Data?
}


extension ItemCD {
    static func getAllItemData(sortBy: ItemCDSort = .buyOn, ascending: Bool = true, filterTime: ItemCDFilterTime = .all) -> NSFetchRequest<ItemCD> {
        let request: NSFetchRequest<ItemCD> = ItemCD.fetchRequest() as! NSFetchRequest<ItemCD>
        let sortDescriptor = NSSortDescriptor(key: sortBy.rawValue, ascending: ascending)
        if filterTime == .week {
            let startDate: NSDate = Date().getLast7Day()! as NSDate
            let endDate: NSDate = NSDate()
            let predicate = NSPredicate(format: "occuredOn >= %@ AND occuredOn <= %@", startDate, endDate)
            request.predicate = predicate
        } else if filterTime == .month {
            let startDate: NSDate = Date().getLast30Day()! as NSDate
            let endDate: NSDate = NSDate()
            let predicate = NSPredicate(format: "occuredOn >= %@ AND occuredOn <= %@", startDate, endDate)
            request.predicate = predicate
        }
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}

