//
//  PersistenceController.swift
//  SwiftCoreDataMVVM
//
//  Created by Martin Wainaina on 06/05/2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Failed to load NSPersistentContainer with error \(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
