//
//  BlackGradient.swift
//  nemo
//
//  Created by been on 2023/05/29.
//

import SwiftUI

struct BgGradient: View {
    
    @State private var bgColor = Color("bgBlack")
    
    var body: some View {
        VStack{
            HStack{}
                .frame(height: 0)
            HStack{
                Spacer()
            }
            .frame(height: 10)
            .background(LinearGradient(colors: [bgColor, .clear], startPoint: .top, endPoint: .bottom))
            Spacer()
            HStack {
                Spacer()
            }
            .frame(height: 10)
            .background(LinearGradient(colors: [bgColor, .clear], startPoint: .bottom, endPoint: .top))
            HStack{}
                .frame(height: 0)
        }
    }
}

struct BgGradient_Previews: PreviewProvider {
    static var previews: some View {
        BgGradient()
    }
}
