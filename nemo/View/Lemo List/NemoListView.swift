//
//  NemoListView.swift
//  nemo
//
//  Created by been on 2023/06/01.
//

import SwiftUI
import WrappingStack

struct NemoListView: View {
    
    @EnvironmentObject var nemoManager: NemoManager
    
    @Binding var selectedNemo: Nemo?
    @Binding var showGuide: Bool
    @Binding var deleteMode: Bool
    
    let nemos: FetchedResults<Nemo>
    
    let type: String
    let color: Color
    let isAlignRight: Bool
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            VStack{
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack{
                        
                        if isAlignRight {
                            GuideView(isAlignRight: true)
                                .opacity(showGuide ? 1 : 0)
                                .padding(.bottom, -6)
                        }
                        
                        WrappingHStack (
                            alignment: isAlignRight ? .trailing : .leading,
                            horizontalSpacing: 2,
                            verticalSpacing: 2
                        ) {
                            ForEach(isAlignRight ?
                                    nemos.filter { $0.type == type && !$0.discarded } :
                                    nemos.filter { $0.type == type && !$0.discarded }.reversed()
                            ) { nemo in
                                NemoView(nemo: nemo, color: color)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        if deleteMode {
                                            nemoManager.discardNemo(nemo)
                                        } else {
                                            withAnimation(.easeInOut(duration: 0.1)){
                                                selectedNemo = nemo
                                            }
                                        }
                                    }
                                    .onAppear {
                                        if isAlignRight && !deleteMode {
                                            scrollViewProxy.scrollTo(nemo.id, anchor: .bottomTrailing)
                                        }
                                    }
                            }
                        }
                        
                        if !isAlignRight {
                            GuideButton(showGuide: $showGuide)
                                .padding(.top, -6)
                            GuideView(isAlignRight: false)
                                .opacity(showGuide ? 1 : 0)
                                .padding(.top, -6)
                        }
                    }.rotationEffect(Angle(degrees: isAlignRight ? 180 : 0))
                }.rotationEffect(Angle(degrees: isAlignRight ? 180 : 0))
                
            }
        }
    }
}


struct NemoListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: FetchRequest<Nemo> = FetchRequest(
            entity: Nemo.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Nemo.createdAt, ascending: true)]
        )
        
        let sampleNemos = fetchRequest.wrappedValue
        
        return VStack {
            NemoListView(selectedNemo: .constant(nil), showGuide: .constant(true), deleteMode: .constant(false), nemos: sampleNemos, type: "a", color: .blue, isAlignRight: true)
                .environmentObject(NemoManager())
                .environment(\.managedObjectContext, context)
            NemoListView(selectedNemo: .constant(nil), showGuide: .constant(true), deleteMode: .constant(false), nemos: sampleNemos, type: "b", color: .blue, isAlignRight: false)
                .environmentObject(NemoManager())
                .environment(\.managedObjectContext, context)
        }
    }
}



//struct NemoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let context = PersistenceController.preview.container.viewContext
//        
//        
//        VStack{
//            NemoListView(nemos: nemos, selectedNemo: .constant(nil), showGuide: .constant(true), deleteMode: .constant(false), type: "a", color: Color.blue, isAlignRight: true)
//                .environmentObject(NemoManager())
//            NemoListView(selectedNemo: .constant(nil), showGuide: .constant(true), deleteMode: .constant(false), type: "b", color: Color.blue, isAlignRight: false)
//                .environmentObject(NemoManager())
//        }
//    }
//}
