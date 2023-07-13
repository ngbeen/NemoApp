//
//  EditModeView.swift
//  Nemo
//
//  Created by been on 2023/06/17.
//

import SwiftUI

struct EditModeView: View {
    
    let nemos: FetchedResults<Nemo>
    
    @State var showTrashView : Bool = false
    
    @Binding var editMode : Bool
    @Binding var deleteMode : Bool
    @Binding var startValue : CGFloat
    

    
    var body: some View {
        HStack (spacing: 2) {
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.1 )){
                    editMode = false
                    deleteMode = false
                    startValue = 0
                }
            }) {Text("돌아가기")}
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .frame(height: 48)
                .background(Ellipse().fill(Color("nemoTeal")))
            
            Spacer()
            
            Button(action: {
                showTrashView = true
                
            }) {Text("휴지통")}
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .frame(height: 48)
                .background(.clear)
                .sheet(isPresented: $showTrashView) {
                    TrashView(nemos: nemos)
                }
            
            Spacer()
            ZStack{
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)){
                        deleteMode.toggle()
                    }
                }) {Text("삭제모드")}
                    .foregroundColor(deleteMode ? Color(.white).opacity(0.5) : Color(.white))
                    .padding(.horizontal, 20)
                    .frame(height: 48)
                    .background(Ellipse().fill(deleteMode ? Color("nemoRed").opacity(0.5) : Color("nemoRed")))
            }
            Spacer()
        }
    }
}

struct EditModeView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: FetchRequest<Nemo> = FetchRequest(
            entity: Nemo.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Nemo.createdAt, ascending: true)]
        )
        
        let sampleNemos = fetchRequest.wrappedValue
        
        return EditModeView(nemos: sampleNemos, editMode: .constant(true), deleteMode: .constant(false), startValue: .constant(0))
            .environment(\.managedObjectContext, context)
    }
}

//struct EditModeView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        EditModeView(editMode: .constant(true), deleteMode: .constant(false), startValue: .constant(0))
//            .background(Color.black)
//    }
//}
