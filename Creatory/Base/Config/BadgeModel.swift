
//
//  File.swift
//  Creatory
//
//  Created by Azmi Muhammad on 20/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import Foundation
import CoreData

struct BadgeModel: CDConfig {
    
    typealias CDModel = Badge
    var model: Badge!
    var context: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.model = CDModel(context: context)
    }
    
    func save(name: String, isReceived: Bool) {
        model.name = name
        model.isReceived = isReceived
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func getAll() -> [Badge] {
        var badges = [Badge]()
        
        do {
            badges = try context.fetch(Badge.fetchRequest())
        } catch {
            print(error)
        }
        
        return badges
    }
    
}
