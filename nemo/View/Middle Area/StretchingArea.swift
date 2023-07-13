//
//  StretchingArea.swift
//  Nemo
//
//  Created by been on 2023/06/17.
//

import SwiftUI

struct StretchingArea: View {
    
    @EnvironmentObject var nemoManager: NemoManager
    
    @Binding var newWord : String
    @Binding var textFieldWidth : CGFloat
    
    var body: some View {
        HStack(spacing:0){
            
            //좌 버튼
            Button(action: {
                nemoManager.createNemo(withWord: newWord, type: "a")
                newWord = ""
            }) {
                Image(systemName: "chevron.down")
                    .foregroundColor(.white)
            }
            .frame(width: 48, height: 48)
            .background(Color("nemoTeal"))
            
            //그라데이션 사각형
            HStack{}
                .frame(width: textFieldWidth + 10, height: 48)
                .background(LinearGradient(colors: [Color("nemoTeal"), Color("nemoBlue")], startPoint: UnitPoint(x: 0.0, y: 0.5), endPoint: UnitPoint(x: 0.3, y: 0.5)))
                
            
            //우 버튼
            Button(action: {
                nemoManager.createNemo(withWord: newWord, type: "b")
                newWord = ""
            }) {
                Image(systemName: "chevron.up")
                    .foregroundColor(.white)
            }
            .frame(width: 48, height: 48)
            .background(Color("nemoBlue"))
        }
    }
}

struct StretchingArea_Previews: PreviewProvider {
    static var previews: some View {
        StretchingArea(newWord: .constant(""), textFieldWidth: .constant(20))
    }
}
