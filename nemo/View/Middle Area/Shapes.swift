//
//  Shapes.swift
//  nemo
//
//  Created by been on 2023/06/05.
//

import SwiftUI

struct TrapezoidShape: Shape {
    
    var startValue : CGFloat
    
    var animatableData: Double {
        get { startValue }
        set { startValue = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: -startValue, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX + startValue, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX + 3 * startValue, y: rect.minY))
        path.addLine(to: CGPoint(x: 0 - 3 * startValue, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

struct NemoNemo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

