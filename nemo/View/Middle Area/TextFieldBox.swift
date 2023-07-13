//
//  TextFieldView.swift
//  Nemo
//
//  Created by been on 2023/06/16.
//

import SwiftUI

struct TextFieldBox: View {
    
    @EnvironmentObject var nemoManager: NemoManager
    
    @FocusState var isTextFieldFocused: Bool
    
    @Binding var newWord : String
    @Binding var textFieldWidth : CGFloat
    @Binding var containedText : Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            TextField("", text: $newWord)
                .onAppear {
                    isTextFieldFocused = true
                }
                .focused($isTextFieldFocused)
                .foregroundColor(.white)
                .frame(width: textFieldWidth + 1) // 최대 너비
                .padding(5)
                .background(Color.black)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .onSubmit {
                    // 엔터 키가 눌렸을 때 실행되는 코드
                    guard !newWord.isEmpty else { return }
                    nemoManager.createNemo(withWord: newWord, type: "b")
                    newWord = ""
                }
                .onChange(of: newWord)
            { newValue in
                
                containedText = !newWord.isEmpty
                
                let width = newWord.widthOfString(usingFont: UIFont.preferredFont(forTextStyle: .body))
                let newWidth = max(width, 28) // 최소 너비
                textFieldWidth = min(newWidth, 250) // 최대 너비
            }
        }
        
    }
}

// 문자열의 너비 계산을 위한 extension
extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
}

struct TextFieldBox_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBox(
            newWord: .constant(""),
            textFieldWidth: .constant(20),
            containedText: .constant(false)
        )
    }
}
