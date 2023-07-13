//
//  NemoUtils.swift
//  nemo
//
//  Created by been on 2023/05/27.
//

import SwiftUI

struct NemoUtils: View {
    
    @Binding var newWord: String
    
    
    var body: some View {
        VStack{
            func addMemo(newWord: String, memos: inout [Memo], sendTrigger: inout Bool) {
                guard !newWord.isEmpty else { return }
                memos.append(Memo(word: newWord))
                sendTrigger = true
            }
            
            
        }
    }
}

struct NemoUtils_Previews: PreviewProvider {
    static var previews: some View {
        NemoUtils(newWord: .constant(""))
    }
}
