//
//  TrashView.swift
//  nemo
//
//  Created by been on 2023/06/04.
//

import SwiftUI
import WrappingStack

struct TrashView: View {
    
    @EnvironmentObject var nemoManager: NemoManager
    
    //    @Binding var selectedNemo: Nemo?
    
//    let nemos: AnySequence<Nemo>
    let nemos: FetchedResults<Nemo>
    var nemo: Nemo?
    
    var body: some View {
        
        
        ScrollView {
            ForEach(nemos.filter { $0.discarded }.reversed()) { nemo in
                HStack (spacing:2) {
                    
                    
                    Button(action: {
                        nemoManager.returnNemo(nemo)
                    }) {
                        Image(systemName: "arrow.uturn.backward")
                    }
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        nemo.type == "b" ? Color("nemoBlue") : Color("nemoTeal")
                    )
                    .onTapGesture {
                        // Handle restore button tapped
                    }
                    HStack{
                        Text(nemo.word ?? "Fail")
                            .padding(.horizontal, 16)
                            .frame(height: 40)
                            .background(
                                Color(.gray)
                            )
                    }
                    
                    Button(action: {
                        nemoManager.deleteNemo(nemo)
                    }) {
                        Image(systemName: "trash")
                    }
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        Color("nemoRed")
                    )
                    .onTapGesture {
                        // Handle delete button tapped
                    }
                }
                
            }
            
            
            
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 20)
        //            HStack{
        //                Rectangle()
        //                    .fill(Color(.clear))
        //
        //            }
        
    }
}

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: FetchRequest<Nemo> = FetchRequest(
            entity: Nemo.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Nemo.createdAt, ascending: true)],
            predicate: NSPredicate(format: "discarded == true")
        )
        
        let sampleNemos = fetchRequest.wrappedValue
        
        return TrashView(nemos: sampleNemos)
            .environment(\.managedObjectContext, context)
            .environmentObject(NemoManager())
    }
}

//struct TrashView_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = PersistenceController.preview.container.viewContext
//        
//        return TrashView(nemos: AnySequence(PreviewData.getNemos(context: context)))
//            .environment(\.managedObjectContext, context)
//            .environmentObject(NemoManager())
//            .environment(\.colorScheme, .dark)
//            .background(Color.black)
//    }
//}
