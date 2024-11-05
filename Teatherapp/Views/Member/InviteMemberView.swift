//
//  Invite_Member_view.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 08-09-2024.
//

import SwiftUI
import Alamofire

struct Invite_Member_view: View {
    @State var selectedPermissionLevel: PermissionLevels=PermissionLevels.fullAccess
    @State var inviteCode = ""
    @State var isLoading = false
    
    
    func generateCode() async -> Void {
        
        do{
            let params: Parameters = [
                "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                "UserName":AppKeysConstant.userName.getValue,
                "circle_id": AppKeysConstant.circleID.getValue,
                "access_type": selectedPermissionLevel.getRequestValue
                
            ]
            
            isLoading = true
            let res: ApiGenericResponseModel<CircleInviteCodeResponseModel> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.circleJoiningCodeGenerate, parameter: params)
            isLoading = false
            
            guard res.status == "1" else{
//                showAlert(message: res.message)
                return
            }
            inviteCode = res.data.circle.invitationCode
            
        } catch(let error){
            isLoading = false
//            showAlert(message: error.localizedDescription)
            print(error);
            
        }
        
    }
    
    func splitAndJoinWithDash(_ input: String) -> String {
        if(input.isEmpty) {
            return ""
        }
        let firstPart = input.prefix(3)
        let secondPart = input.suffix(3)
        return "\(firstPart)-\(secondPart)"
    }

    
    
    var body: some View {
        VStack(alignment: .leading){
                AppBarView(title: "Invite Team Member")
                Text("Share this invite code with the people you want in your circle:").font(.title3).bold().padding(.all)
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundStyle(.yellow.opacity(0.2)).frame(maxWidth:UIScreen.screenWidth - 20, minHeight: 100,maxHeight: 100)
                    Text(splitAndJoinWithDash(inviteCode)).bold().font(.largeTitle).foregroundStyle(.textBluishBlack)
                }
                
                Text("This code will be active for 3 days").font(.title3).foregroundStyle(.blue).frame(maxWidth: UIScreen.screenWidth - 20,alignment: .center)
                Text("Share your code out loud or send it in a message").font(.caption).multilineTextAlignment(.center).foregroundStyle(.textBluishBlack).frame(maxWidth: UIScreen.screenWidth - 30,alignment: .center)
                Text("Select Permission Level").font(.title3).bold().padding(.top, 5)
            
                RadioView(value: PermissionLevels.fullAccess.getValue, isSelected: PermissionLevels.fullAccess == selectedPermissionLevel, onTap: {
                    selectedPermissionLevel = PermissionLevels.fullAccess
                })
                
                
                RadioView(value: PermissionLevels.limitedAccess.getValue, isSelected: PermissionLevels.limitedAccess == selectedPermissionLevel, onTap: {
                    selectedPermissionLevel = PermissionLevels.limitedAccess
                })
                
                
                RadioView(value: PermissionLevels.childAccess.getValue, isSelected: PermissionLevels.childAccess == selectedPermissionLevel, onTap: {
                    selectedPermissionLevel = PermissionLevels.childAccess
                })
            ShareLink(item: URL(string: "https://account.mydispatchapp.com/create")!, subject: Text("Join My Tether Circle!"),message: Text("Join My Tether Circle! My Invite code \(splitAndJoinWithDash(inviteCode)).\nDownload the app here: https://account.mydispatchapp.com/create")) {
                Text("Send").frame(maxWidth: UIScreen.screenWidth - 20,minHeight: 50).background(.blue).foregroundStyle(.white).cornerRadius(radius: 50, corners:.allCorners).padding(.top)
                    }
            

        
            NavigationLink {
                AddNewMemberView()
            } label: {
                
                Text("\(Text("If you want to add a new member to the circle then ")) \(Text("Click here. ").foregroundStyle(.appBlue))").fontWeight(.semibold).font(.body)
            }

                
                Spacer()
            }.padding(.horizontal).overlay {
                if(isLoading){
                    ZStack{
                        Color.black.opacity(0.4)
                        LoadingView()
                    }.ignoresSafeArea(.all)
                }
            }.onAppear {
                Task{
                    await generateCode()
                }
            }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Invite_Member_view()
}

struct CircleInviteCodeResponseModel: Codable {
    let circle: CircleInviteCodeModel
}

struct CircleInviteCodeModel: Codable {
    let id, userID, circleName, type: String
    let invitationCode, codeGeneratedDate, status, createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case circleName = "circle_name"
        case type
        case invitationCode = "invitation_code"
        case codeGeneratedDate = "code_generated_date"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}



