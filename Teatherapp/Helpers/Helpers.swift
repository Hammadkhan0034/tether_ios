import SwiftUI


struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {
            // 2
            configuration.isOn.toggle()
        }, label: {
            HStack {
                // 3
                configuration.label
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            }
        })
    }
}
