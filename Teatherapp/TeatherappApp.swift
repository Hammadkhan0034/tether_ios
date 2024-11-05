import SwiftUI
import SwiftData
@main
struct TeatherappApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject var userAuth = UserAuth()
    @StateObject var tfModel = TFBottomBarModel()
    @State var dashboardVM = DashboardModelViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RootViewController().environment(dashboardVM)
                    .environmentObject(userAuth)
                    .environmentObject(tfModel)
            }
        }
//        .onChange(of: scenePhase) { newScenePhase in
//            switch newScenePhase {
//            case .active:
//                print("App is active")
////                UIApplication.shared.applicationIconBadgeNumber = 0
//            case .inactive:
//                print("App is inactive")
//            case .background:
//                print("App is in background")
//            @unknown default:
//                print("Oh - interesting: I received an unexpected new value.")
//            }
//        }
    }
}

private struct DashboardViewModelKey: EnvironmentKey {
    static let defaultValue: Binding<DashboardModelViewModel>? = nil
}

extension EnvironmentValues {
    var isLoading: Binding<DashboardModelViewModel>? {
        get { self[DashboardViewModelKey.self] }
        set { self[DashboardViewModelKey.self] = newValue }
    }
}
