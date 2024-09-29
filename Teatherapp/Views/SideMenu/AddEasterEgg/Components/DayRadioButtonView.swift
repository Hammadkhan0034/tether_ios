
import SwiftUI

struct DayRadioButtonView: View {
    @Binding var selectedWeekday: Weekday
    @State var weekday: Weekday
    var body: some View {
        Button(action: {
            self.selectedWeekday = weekday
        }) {
            Circle().foregroundStyle(selectedWeekday == weekday ? .textBluishBlack.opacity(0.7) : .gray.opacity(0.5))
                .frame(width: 35, height: 35)
                    .overlay(
                        Text(AppConstants.weekdays[weekday.rawValue]).font(.body).foregroundStyle(weekday == selectedWeekday ? .white : .textBluishBlack)
                    )
            
        }
        .buttonStyle(PlainButtonStyle())
        }
}

#Preview {
    DayRadioButtonView(selectedWeekday: .constant(Weekday.monday), weekday: Weekday.monday)
}


