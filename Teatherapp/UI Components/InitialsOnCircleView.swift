import SwiftUI
struct InitialsOnCircleView: View {
    
    let initials: String
    let radius: CGFloat
    let circleColor: Color
    var squareSide: CGFloat {
        2.0.squareRoot() * radius
    }
    
    var body: some View {
        ZStack {
            Circle().fill(circleColor)
               .frame(width: radius * 2, height: radius * 2)
            // Use this implementation for an SF Symbol
            Text(initials).font(.title3).bold().foregroundStyle(.white)
            
        }
    }
}
