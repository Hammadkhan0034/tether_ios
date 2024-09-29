
import SwiftUI

struct CheckInScheduleView: View {
    var body: some View {
        NavigationView{
            VStack{
                AppBarView(title: "Schedule Check-In")
                Spacer()
                Text("No Data Found!").font(.title2).foregroundStyle(.textBluishBlack).fontWeight(.semibold)
                Spacer()
                
                NavigationLink(destination: {
                    AddScheduleCheckInView()      .navigationBarBackButtonHidden(true)          }, label: {
                        Label(title: {Text("Add Check-In").font(.title3).fontWeight(.bold ).foregroundStyle(.white).padding(.leading)}, icon: {Image(systemName: "plus").font(.title3).fontWeight(.bold ).foregroundStyle(.white)}).frame(width: 240,height: 50,alignment: .center).background(.appBlue).cornerRadius(radius: 10, corners: .allCorners).shadow(radius: 10)
                    
                    
                })
            }.padding(.horizontal)
            
        }
    }
}

#Preview {
    CheckInScheduleView()
}
