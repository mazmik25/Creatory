//
//  CDHelper.swift
//  Creatory
//
//  Created by Azmi Muhammad on 20/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import Foundation
import CoreData

protocol CDConfig {
    associatedtype CDModel: NSManagedObject
    var model: CDModel! { get set }
    var context: NSManagedObjectContext! { get set }
    init(context: NSManagedObjectContext)
    func getAll() -> [CDModel]
}
