//
//  SplashView.swift
//  nemo
//
//  Created by been on 2023/06/07.
//

import SwiftUI


struct SplashView: View {
    
    @State private var tealPosition: CGPoint = .zero
    @State private var bluePosition: CGPoint = .zero
    
    var body: some View {
        ZStack{
            
            Color("bgBlack").ignoresSafeArea()
            Rectangle()
                .fill(Color("nemoTeal"))
                .frame(width: 95, height: 95)
                .offset(x: tealPosition.x, y: tealPosition.y)
                            
                            // onAppear 또는 다른 이벤트에서 애니메이션 트리거
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation (.timingCurve(0.05, 0.5, 0.25, 1, duration: 1.0)) {
                            tealPosition = CGPoint(x: -17, y: 17) // 이동할 위치 설정
                        }
                    }
                }
            Rectangle()
                .fill(.clear)
                .frame(width: 60, height: 60)
                .overlay(
                    Rectangle()
                        .stroke(Color("nemoBlue"), lineWidth: 35)

                )
                .offset(x: bluePosition.x, y: bluePosition.y)
                           
                            
                            // onAppear 또는 다른 이벤트에서 애니메이션 트리거
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation (.timingCurve(0.05, 0.5, 0.25, 1, duration: 1.0)) {
                            bluePosition = CGPoint(x: 17, y: -17) // 이동할 위치 설정
                        }
                    }
                }
            
                
                
            
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
