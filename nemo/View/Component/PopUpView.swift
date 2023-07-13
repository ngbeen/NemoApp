//
//  popUpView.swift
//  nemo
//
//  Created by been on 2023/06/03.
//

import SwiftUI

struct PopUpView: View {
    
    @EnvironmentObject var nemoManager: NemoManager
    
    @FocusState private var isTextFieldFocused: Bool
    
    @Binding var selectedNemo: Nemo?
    
    @State private var editedWord: String = ""
    
//    var buttonTrigger : Bool = false
    var nemo: Nemo?
    

    var body: some View {
        
        if let nemo = selectedNemo {
            HStack{
                HStack{}
                    .onAppear{editedWord = nemo.word ?? ""}
                ZStack{
                    Color.black.opacity(0.9)
                        .onTapGesture {
                            self.selectedNemo = nil
                        }
                    VStack{
                        Spacer()
                        VStack (spacing: 2){
                            
                            HStack (spacing: 2){
                                
                                //닫기버튼
                                if editedWord == (nemo.word ?? "") {
                                    Button(action: {
                                        self.selectedNemo = nil
                                    }) {
                                        Image(systemName: "xmark"
                                        )
                                    }
                                    .foregroundColor(.white)
                                    .frame(width: 48, height: 48)
                                    .background(
                                        nemo.type == "a" ? Color("nemoBlue") : Color("nemoTeal")
                                    )
                                } else {
                                    Button(action: {
                                        self.selectedNemo = nil
                                    }) {
                                        Text("그냥 나가기")
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .frame(height: 48)
                                    .background(
                                        nemo.type == "a" ? Color("nemoBlue") : Color("nemoTeal")
                                    )
                                }
                                Spacer()
                            }
                            
                            ZStack{
                                TextField("text", text: $editedWord, axis: .vertical)
                                    .multilineTextAlignment(.center)
                                    .focused($isTextFieldFocused)
                                    .onAppear {
                                        isTextFieldFocused = true
                                    }
                                    .accentColor(.white)
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(
                                nemo.type == "a" ? Color("nemoTeal") : Color("nemoBlue")
                            )
                            .foregroundColor(.white)
                            .onSubmit {
                                nemoManager.createNemo(withWord: editedWord, type: nemo.type ?? "", createdAt: nemo.createdAt)
                                nemoManager.discardNemo(nemo)
                                self.selectedNemo = nil
                            }
                            
                            
                            HStack (spacing: 2){
                                
                                //폴더이동 버튼
                                
                                Button(action: {
                                    nemoManager.moveNemo(nemo)
                                    withAnimation(.easeInOut(duration: 0.1)){
                                        self.selectedNemo = nil
                                        self.selectedNemo = nemo
                                    }
                                }) {
                                    Text("폴더 이동")
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .frame(height: 48)
                                .background(
                                    nemo.type == "a" ? Color("nemoBlue") : Color("nemoTeal")
                                )
                                
                                
                                
                                //복사 & 확인 버튼
                                if editedWord == (nemo.word ?? "") {
                                    Button(action: {
                                        UIPasteboard.general.string = editedWord
                                        self.selectedNemo = nil
                                    }) {
                                        Text("전체 복사")
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .frame(height: 48)
                                    .background(
                                        nemo.type == "a" ? Color("nemoTeal") : Color("nemoBlue")
                                    )
                                    Spacer()
                                } else {
                                    Button(action: {
                                        nemoManager.createNemo(withWord: editedWord, type: nemo.type ?? "", createdAt: nemo.createdAt)
                                        nemoManager.discardNemo(nemo)
                                        self.selectedNemo = nil
                                    }) {
                                        Text ("저장하고 나가기")
                                        
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .frame(height: 48)
                                    .background(
                                        nemo.type == "a" ? Color("nemoTeal") : Color("nemoBlue")
                                    )
                                }
                                
                                
                                
                                Spacer()
                                
                                //삭제버튼
                                Button(action: {
                                    nemoManager.discardNemo(nemo)
                                    self.selectedNemo = nil
                                    
                                }) {
                                    Image(systemName: "trash")
                                }
                                .foregroundColor(.white)
                                .frame(width: 48, height: 48)
                                .background(Color("nemoRed"))
                                
                                
                                
                                
                            }
                            
                            HStack{
                                
                            }
                            
                            
                        }
                        
                        Spacer()
                    }
                }
                
            }
        }
        else {
            EmptyView()
        }
            
    }
}


//struct PopUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = PersistenceController.preview.container.viewContext
//        let nemos = PreviewData.getNemos(context: context)
//        
//        return PopUpView(selectedNemo: .constant(nemos.first))
//            .environment(\.managedObjectContext, context)
//            .environmentObject(NemoManager())
//    }
//}
//
