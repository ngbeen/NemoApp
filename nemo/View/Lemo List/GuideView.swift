//
//  GuideView.swift
//  Nemo
//
//  Created by been on 2023/06/17.
//

import SwiftUI
import WrappingStack

struct GuideView: View {
 
    struct Dummy: Identifiable {
        let id: Int
        let name: String
    }
    
    let dummyArray: [Dummy] = [
        
        Dummy(id: 1, name: "네모 프레임을 터치해서 글을 적어 보세요. 🖋️"),
        Dummy(id: 2, name: "작성한 네모를 터치하면 글을 수정할 수 있어요. 🩹"),
        Dummy(id: 3, name: "위, 아래 영역을 폴더처럼 이용해 보세요. 📂"),
        
        Dummy(id: 7, name: "🔧 네모 프레임 양쪽의 숫자를 터치해 보세요."),
        Dummy(id: 8, name: "🗑️ 휴지통에서 지워진 네모를 볼 수 있어요."),
        Dummy(id: 9, name: "🔥 삭제모드로 네모를 빠르게 지워 보세요."),
        
    ]
    
    let isAlignRight: Bool
    
    var body: some View {

            WrappingHStack (
                alignment: isAlignRight ? .trailing : .leading ,
                horizontalSpacing: 2,
                verticalSpacing: 2
            ) {
                ForEach(dummyArray.filter{ dummy in isAlignRight ? (1...6).contains(dummy.id) : (7...12).contains(dummy.id)}) { dummy in
                    Text(dummy.name)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .background(isAlignRight ? Color("nemoDirtyBlue") : Color("nemoDirtyTeal"))
                        .cornerRadius(0)
                }
            }
            
        
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            GuideView(isAlignRight: true)
            GuideView(isAlignRight: false)
        }
        .background(Color.black)
    }
}
