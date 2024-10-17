import SwiftUI
struct ImageOnCircle: View {
    
    let icon: String
    let radius: CGFloat
    let circleColor: Color
    let imageColor: Color
    let shadowRadius: CGFloat
    
    init(icon: String, radius: CGFloat, circleColor: Color, imageColor: Color, shadowRadius: CGFloat = 0) {
        self.icon = icon
        self.radius = radius
        self.circleColor = circleColor
        self.imageColor = imageColor
        self.shadowRadius = shadowRadius
    }
    var body: some View {
        ZStack {
            Circle().fill(circleColor)
                .frame(width: radius * 2, height: radius * 2).shadow(radius: shadowRadius)
            // Use this implementation for an SF Symbol
            Image(systemName: icon)
                .resizable()
                .aspectRatio(1.0,contentMode: .fit)
                .foregroundColor(imageColor).padding(10)
        
        }.frame(width: radius * 2, height: radius * 2)
    }
}
