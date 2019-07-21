//
//  StoryModel.swift
//  Creatory
//
//  Created by Azmi Muhammad on 20/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import Foundation
import CoreData

struct StoryModel: CDConfig {
    
    typealias CDModel = Story
    var model: Story!
    var context: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.model = CDModel(context: context)
    }
    
    func updateTitle(title: String) {
        
    }
    
    func save(name: String, isReceived: Bool) {
        
        
    }
    
    func getAll() -> [Story] {
        var stories = [Story]()
        
        do {
            stories = try context.fetch(CDModel.fetchRequest())
        } catch {
            print(error)
        }
        
        return stories
    }
    
}
