//
//  SwiftUIView2.swift
//  nemo
//
//  Created by been on 2023/05/26.
//

import SwiftUI

struct SwiftUIView2: View {
    @State private var isExpanded = false
    
    var body: some View {
        Button(action: {
            withAnimation {
                // 애니메이션 블록 내에서 @State 속성 변경
                isExpanded.toggle()
            }
        }) {
            Text("Toggle")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
        .frame(width: isExpanded ? 200 : 100, height: isExpanded ? 300 : 200)
    }
}
struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2()
    }
}
