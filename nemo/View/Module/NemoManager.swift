//
//  NemoManager.swift
//  nemo
//
//  Created by been on 2023/05/30.
//

import SwiftUI

class NemoManager: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    
    func createNemo(withWord word: String, type: String, createdAt: Date? = nil) {
        
        //        withAnimation(Animation.easeInOut(duration: 0.2)) {
        let nemo = Nemo(context: viewContext)
        nemo.id = UUID()
        nemo.word = word
        nemo.type = type
        nemo.discarded = false
        
        if let createdAt = createdAt {
                nemo.createdAt = createdAt
            } else {
                nemo.createdAt = Date()
            }
        
        try? viewContext.save()
        //        viewContext.refreshAllObjects()
        //        }
    }
    
    func discardNemo(_ nemo: Nemo) {
        nemo.discarded = true
        try? viewContext.save()
    }
    
    func returnNemo(_ nemo: Nemo) {
        nemo.discarded = false
        try? viewContext.save()
    }
    
    
    func deleteNemo(_ nemo: Nemo) {
        //            withAnimation {
        viewContext.delete(nemo)
        try? viewContext.save()
        //            }
    }
    
    func moveNemo(_ nemo: Nemo) {
        if nemo.type == "a" {
            nemo.type = "b"
        } else if nemo.type == "b" {
            nemo.type = "a"
        }
        try? viewContext.save()
    }
    
    func updateNemoWord(_ nemo: Nemo, withWord word: String) {
        nemo.word = word
        try? viewContext.save()
    }

    
}
