//
//  MidView.swift
//  nemo
//
//  Created by been on 2023/05/29.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var newWord: String = ""
    @State var textFieldWidth: CGFloat = 28
    
    @Binding var startValue : CGFloat
    @Binding var containedText : Bool
    @Binding var editMode : Bool
    
    var body: some View {
        
        ZStack{
            //텍스트 테두리(늘어나는 영역)
            ZStack{
                if containedText {
                    StretchingArea(newWord: $newWord, textFieldWidth: $textFieldWidth)
                }
                else {
                    Rectangle()
                        .fill(editMode ? Color(.gray) : Color("nemoBlue"))
                }
            }
            .mask{
               TrapezoidShape(startValue: startValue)
                .fill(Color("nemoBlue"))
                .background(.clear)
                .frame(width:
                        containedText ? textFieldWidth + 106 : textFieldWidth + 30, height: 48
                )
            }
            
            if !editMode {
                TextFieldBox(newWord: $newWord, textFieldWidth: $textFieldWidth, containedText: $containedText)
            }
        }
        .animation(.easeInOut(duration: 0.1), value: containedText)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TextFieldView(startValue: .constant(0), containedText: .constant(false), editMode: .constant(false))
                .background(Color.black)
            TextFieldView(startValue: .constant(6), containedText: .constant(false), editMode: .constant(true))
                .background(Color.black)
        }
    }
}
