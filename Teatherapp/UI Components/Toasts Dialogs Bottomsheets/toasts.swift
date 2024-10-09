//
//  toasts.swift
//  Teatherapp
//
//  Created by Hammad Khan on 09/10/2024.
//

import SwiftUI

struct SimpleToastView: View {
    @Environment(\.dismiss) var dismiss

    
    var message: String
    @Binding var isShowing: Bool
    var duration: Int
    var shouldDismiss: Bool
    
    init( message: String, isShowing: Binding<Bool>, duration: Int = 2, shouldDismiss: Bool = true) {
        self.message = message
        self.duration = duration
        self.shouldDismiss = shouldDismiss
        self._isShowing = isShowing

    }
    
    
    var body: some View {
        if isShowing {
            Text(message)
                .padding()
                .background(Color.black.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(8)
                .transition(.slide)
                .animation(.easeInOut, value: isShowing)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .center)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isShowing = false
                            
                        }
                        dismiss()
                    }
                }
        }
    }
}
