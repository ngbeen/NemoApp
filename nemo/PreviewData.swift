//
//  PreviewData.swift
//  Nemo
//
//  Created by been on 2023/06/16.
//

import Foundation
import CoreData
import SwiftUI

struct PreviewData {
    static func createSampleData(context: NSManagedObjectContext) {
        
        let nemo = Nemo(context: context)
        nemo.id = UUID()
        nemo.word = "테스트 단어"
        nemo.type = "a"
        nemo.discarded = false
        nemo.createdAt = Date()
        
        let nemo2 = Nemo(context: context)
        nemo2.id = UUID()
        nemo2.word = "테스트 단어"
        nemo2.type = "b"
        nemo2.discarded = false
        nemo2.createdAt = Date()
        
        let nemo3 = Nemo(context: context)
        nemo3.id = UUID()
        nemo3.word = "버려진 단어"
        nemo3.type = "a"
        nemo3.discarded = true
        nemo3.createdAt = Date()
    }
}
