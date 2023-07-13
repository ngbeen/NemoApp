//
//  nemoApp.swift
//  nemo
//
//  Created by been on 2023/05/25.
//

import SwiftUI

@main

struct YourApp: App {
    
    @State private var showContent = false // 스플릿뷰를 부르는 변수
    
    @AppStorage("isDarkModeEnabled") var isDarkModeEnabled = true // 다크 모드 상태를 저장하는 변수
    @StateObject private var nemoManager = NemoManager()

    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Group {
                if showContent {
                    ContentView()

                } else {
                    SplashView()
                    
                }
            }
            .preferredColorScheme(isDarkModeEnabled ? .dark : .light) // 다크 모드 상태에 따라 컬러 스킴 설정
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(nemoManager)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        showContent = true
                    }
                }
            }
        }
        
        
        
        
    }
}


