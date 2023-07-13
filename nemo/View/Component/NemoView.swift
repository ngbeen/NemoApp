//
//  NemoView.swift
//  nemo
//
//  Created by been on 2023/05/29.
//

import SwiftUI

struct NemoView: View {
    
    @ObservedObject var nemo: Nemo
    
    let color: Color
    
    var body: some View {
        Text(nemo.word ?? "Fail")
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .font(.system(size: 17))
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(0)
    }
}

struct NemoView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let nemo = Nemo(context: context)
        nemo.word = "테스트 단어"
        nemo.type = "a"
        
        return NemoView(nemo: nemo, color: Color.blue)
    }
}
