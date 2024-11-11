

import Foundation
import SwiftUI



struct GlobalMessageView: View {
    
    @Binding var messageWrapper: MessageWrapper?
    
    private var backgroundColor: Color {
        
        guard let messageType = messageWrapper?.messageType else {
            return .clear
        }
        
        switch messageType {
        case .error:
            return .red
        case .info:
            return .blue
        case .success:
            return .green
        }
    }
    
    var body: some View {
        Text(messageWrapper?.message ?? "")
            .frame(width: 300)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .foregroundStyle(.white)
            .task(id: messageWrapper?.id) {
                try? await Task.sleep(for: .seconds(messageWrapper?.delay ?? 2.0))
                guard !Task.isCancelled else { return }
                withAnimation {
                    messageWrapper = nil
                }
            }
    }
}

#Preview {
    GlobalMessageView(messageWrapper: .constant(MessageWrapper(message: "This is an error message.")))
}




struct MessageWrapper: Identifiable {
    let id = UUID()
    var message: String
    var delay: Double = 2.0
    var messageType: MessageType = .error
}

struct WithMessageView: ViewModifier {
    
    @State private var messageWrapper: MessageWrapper?
    
    func body(content: Content) -> some View {
        content
            .environment(\.showMessage, ShowMessageAction(action: { message, messageType, delay in
                self.messageWrapper = MessageWrapper(message: message, delay: delay, messageType: messageType)
            }))
            .overlay(alignment: .bottom) {
                messageWrapper != nil ? GlobalMessageView(messageWrapper: $messageWrapper): nil
            }
    }
    
}

extension View {
    
    func withMessageView() -> some View {
        modifier(WithMessageView())
    }
    
}


enum MessageType {
    case error
    case info
    case success
}

struct ShowMessageAction {
    typealias Action = (String, MessageType, Double) -> ()
    let action: Action
    
    func callAsFunction(_ message: String, _ messageType: MessageType = .error, _ delay: Double = 2.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            action(message, messageType, delay)
            
        }
        
    }
}

struct ShowMessageEnvironmentKey: EnvironmentKey {
    static var defaultValue: ShowMessageAction = ShowMessageAction { _, _, _ in }
}

extension EnvironmentValues {
    var showMessage: (ShowMessageAction) {
        get { self[ShowMessageEnvironmentKey.self] }
        set { self[ShowMessageEnvironmentKey.self] = newValue }
    }
}
