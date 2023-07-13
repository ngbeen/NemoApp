//
//  MidView.swift
//  Nemo
//
//  Created by been on 2023/06/17.
//

import SwiftUI

struct MidView: View {

    @State var editMode : Bool = false
    @State var startValue : CGFloat = 0.0
    @State var containedText : Bool = false
    
    let nemos: FetchedResults<Nemo>
    
    @Binding var deleteMode : Bool
    
    var body: some View {
        ZStack{

            TextFieldView(startValue: $startValue, containedText: $containedText, editMode: $editMode)
                
            if editMode {
                EditModeView(nemos: nemos, editMode: $editMode, deleteMode: $deleteMode, startValue: $startValue)
                
            } else if !containedText {
                CounterView(editMode: $editMode, startValue: $startValue, nemos: nemos)
            }
        }
    }
}

struct MidView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: FetchRequest<Nemo> = FetchRequest(
            entity: Nemo.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Nemo.createdAt, ascending: true)]
        )
        
        let sampleNemos = fetchRequest.wrappedValue
        
        return MidView(nemos: sampleNemos, deleteMode: .constant(false))
            .environment(\.managedObjectContext, context)
    }
}
