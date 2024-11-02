//
//  SelectMemberView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 31/10/2024.
//

import SwiftUI
import Alamofire

struct SelectMemberView: View {
//    @Environment(\.dashboardVM) var dashboardVM
    let locationId: String
    @State var members : [MemberDashboardModel]
    @State var selectedMembers: [String] = []
    @State var isAllSelected: Bool = false
    let onShare : (_ selectedMembers: [String]) async ->Void
    init(locationId: String, members: [MemberDashboardModel],onShare: @escaping (_: [String]) async -> Void) {
        self.locationId = locationId
        self.members = members.filter{$0.userID != AppKeysConstant.userID.getValue as! String}
        self.onShare = onShare
    }
    
    func addOrRemoveMember(id: String){
        if(selectedMembers.contains(id)){
            selectedMembers.removeAll { memberId in
                memberId == id
            }
        }
        else{
            selectedMembers.append(id)
        }
    }
    
    func selectOrUnSelectAll(){
        isAllSelected.toggle()
        if(isAllSelected){
            selectedMembers = members.map{$0.id}
        }
        else{
            selectedMembers.removeAll()
        }
    }
    
    
    
    
    var body: some View {
        VStack{
            HStack{ Text("Select Member").font(.title2).fontWeight(.semibold).foregroundStyle(.appBlue)
                
                
            Spacer()
                if(!members.isEmpty){
                    TFButton(label: "Share", onClick: {
                        Task{
                            await onShare(selectedMembers)
                        }
                    },width:120,height: 40)
                }
            }.padding(.all)
            
            if(!members.isEmpty){
                HStack{
                    Spacer()
                    SelectAllRadioButton(title: "Select All", isSelected: isAllSelected, onClick: selectOrUnSelectAll)
                }
            }
            
            if(members.isEmpty){
                VStack{
                    Spacer()
                    
                    Text("No Member Found").font(.title2).bold().foregroundStyle(.gray)
                    Spacer()
                }
            }
            
            if(!members.isEmpty){
                List(members){ member in
                    
                    ZStack{
                        Rectangle().foregroundStyle(.white).cornerRadius(radius: 10, corners: .allCorners).shadow(radius: 2)
                        
                        HStack{
                            AsyncImage(url: URL(string: member.userImage)).frame(width: 55,height: 55).cornerRadius(radius: 50, corners: .allCorners)
                            Text(member.name).font(.title3).fontWeight(.semibold).foregroundStyle(.appBlue)
                            Spacer()
                            SelectAllRadioButton(title: "", isSelected: selectedMembers.contains(member.id), onClick: {
                                addOrRemoveMember(id: member.id)
                            })
                        }.padding(.all)
                    }.listRowSeparator(.hidden).listRowInsets(EdgeInsets()).padding(.all,10)
                    
                }.listStyle(.inset)
                
            }
            
            if(members.isEmpty){
                HStack{ Image(systemName: "plus.circle.fill").resizable().frame(width: 50,height: 50).foregroundStyle(.appBlue).padding(.trailing)
                    
                    Text("Add a new Member").font(.title3).fontWeight(.medium).foregroundStyle(.textBluishBlack)
                }
            }
        }
    }
}

#Preview {
    SelectMemberView(locationId: "21",members:  testCircles.first!.members) { selectedMembers in
        
    }
}
