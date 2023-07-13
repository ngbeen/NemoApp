//
//  Persistence.swift
//  nemo
//
//  Created by been on 2023/05/29.
//

import CoreData
import CloudKit

struct PersistenceController {
    static let shared = PersistenceController()
    
    // Storage for Core Data
    let container: NSPersistentCloudKitContainer
    
    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        // Create an example list.
        let viewContext = controller.container.viewContext
        let nemo = Nemo(context: viewContext)
        
        nemo.id = UUID()
        nemo.word = "테스트 단어"
        nemo.type = "b"
        nemo.discarded = false
        nemo.createdAt = Date()
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        
        return controller
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Nemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        #if DEBUG
        do {
            try container.initializeCloudKitSchema()
        } catch {
            print("=======================================")
            print("\(#function): initializeCloudKitSchema: \(error)")
            print("=======================================")
        }
        #endif
        
        do {
            try container.viewContext.setQueryGenerationFrom(.current)
        } catch {
            fatalError("#\(#function): Failed to pin viewContext to the current generation:\(error)")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
