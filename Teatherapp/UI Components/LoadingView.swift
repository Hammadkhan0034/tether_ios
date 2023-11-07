//
//  ProgressView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 02/11/2023.
//

import SwiftUI

struct AnimationData {
    var delay: TimeInterval
    var ty: CGFloat
}

let ITEMS = [
    AnimationData(delay: 0.0, ty: -30),
    AnimationData(delay: 0.1, ty: -40),
    AnimationData(delay: 0.2, ty: -50),
    AnimationData(delay: 0.2, ty: -60),
]

struct LoadingView: View {
    
    @State var transY: [CGFloat] = ITEMS.map { _ in return 0 }
    var animation = Animation.easeInOut.speed(0.6)
    
    var body: some View {
        HStack {
            DotView(transY: $transY[0])
            DotView(transY: $transY[1])
            DotView(transY: $transY[2])
            DotView(transY: $transY[3])
        }
        .onAppear {
            animateDots() // Not defined yet
        }
    }
    
    func animateDots() {
        // Go through animation data and start each
        // animation delayed as per data
        for (index, data) in ITEMS.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + data.delay) {
                animateDot(binding: $transY[index], animationData: data)
            }
        }
        
        //Repeat main loop
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            animateDots()
        }
    }
    
    func animateDot(binding: Binding<CGFloat>, animationData: AnimationData) {
        withAnimation(animation) {
            binding.wrappedValue = animationData.ty
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(animation) {
                binding.wrappedValue = 0
            }
        }
    }
}

struct DotView: View {
    
    @Binding var transY: CGFloat
    
    var body: some View {
        VStack{}
            .frame(width: 20, height: 20, alignment: .center)
            .background(Color.appBlue)
            .cornerRadius(10.0)
            .offset(x: 0, y: transY)
    }
}
