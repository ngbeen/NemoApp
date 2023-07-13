//
//  CounterView.swift
//  Nemo
//
//  Created by been on 2023/06/17.
//

import SwiftUI



struct CounterView: View {

    
    @Binding var editMode : Bool
    @Binding var startValue : CGFloat
    
    let nemos: FetchedResults<Nemo>
    
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                withAnimation(.easeOut(duration: 0.1)){
                    editMode = true
                    startValue = 6
                }
            }) {
                Text("\(nemos.filter { $0.type == "a" && !$0.discarded }.count)")
                    .foregroundColor(editMode ? Color(.clear) : Color("nemoTeal"))
            }
            Spacer()
            Spacer()
            Spacer()
            Button(action: {
                
                editMode = true
                startValue = 6
                
            }) {
                Text("\(nemos.filter { $0.type == "b" && !$0.discarded }.count)")
                    .foregroundColor( editMode ? Color(.clear) : Color("nemoBlue"))
            }
            Spacer()
        }
        
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: FetchRequest<Nemo> = FetchRequest(
            entity: Nemo.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Nemo.createdAt, ascending: true)]
        )
        
        let sampleNemos = fetchRequest.wrappedValue
        
        return CounterView(editMode: .constant(false), startValue: .constant(0), nemos: sampleNemos)
            .environment(\.managedObjectContext, context)
    }
}


//struct CounterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CounterView(editMode: .constant(false), startValue: .constant(0))
//            .background(Color.black)
//    }
//}
