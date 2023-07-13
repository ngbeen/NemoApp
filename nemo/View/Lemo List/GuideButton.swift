//
//  GuideButton.swift
//  Nemo
//
//  Created by been on 2023/06/17.
//

import SwiftUI

struct GuideButton: View {
    
    @Binding var showGuide : Bool
    
    var body: some View {
        HStack {
            HStack{
                showGuide ? Text("가이드 보이기") : Text("가이드 가리기")
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.1)) {
                    showGuide.toggle()
                }
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .font(.system(size: 17))
            .foregroundColor(.white)
            .background(showGuide ? Color("nemoTeal") : Color("nemoDirtyTeal"))
            .cornerRadius(0)
            
            Spacer()
        }
    }
}

struct GuideButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            GuideButton(showGuide: .constant(true))
            GuideButton(showGuide: .constant(false))
        }
    }
}
