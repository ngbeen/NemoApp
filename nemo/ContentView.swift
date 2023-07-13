//
//  ContentView.swift
//  nemo
//
//  Created by been on 2023/05/25.
//

import SwiftUI

struct ContentView: View {
 
    @FetchRequest(
        entity: Nemo.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Nemo.createdAt, ascending: true)]
    )
    
    private var nemos: FetchedResults<Nemo>
    
    @State var showGuide : Bool = true
    @State var deleteMode : Bool = false
    @State var selectedNemo: Nemo?
    
    @State private var bgColor = Color("bgBlack")
    
    var body: some View {
        ZStack{
            
            VStack{
                HStack{} //안전영역을 위한 HStack
                    .frame(minHeight: 0)

                NemoListView(selectedNemo: $selectedNemo, showGuide: $showGuide, deleteMode: $deleteMode, nemos: nemos, type: "b", color: deleteMode ? Color("nemoRed") : Color("nemoBlue"), isAlignRight: true)
                
                MidView(nemos: nemos, deleteMode: $deleteMode)
                    .padding(0)
                    .frame(height: 48)
                
                NemoListView(selectedNemo: $selectedNemo, showGuide: $showGuide, deleteMode: $deleteMode, nemos: nemos, type: "a", color: deleteMode ? Color("nemoRed") : Color("nemoTeal"), isAlignRight: false)

                HStack{} //안전영역을 위한 HStack
                    .frame(minHeight: 0)
            }
            .background(bgColor)
            
            BgGradient()
            
            if selectedNemo != nil {
                PopUpView(selectedNemo: $selectedNemo, nemo: selectedNemo)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        PreviewData.createSampleData(context: context) // 샘플 데이터 생성
        
        return ContentView()
            .environment(\.managedObjectContext, context)
            .environment(\.colorScheme, .dark)
            .background(Color.black)
    }
}
