//
//  SceneDelegate.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import UIKit

final class RoutingManager {
    static let shared: RoutingManager = .init()
    
    private var window: UIWindow!
    
    func initialize(window: UIWindow) {
        self.window = window
    }
    
    func setRootViewController(_ navigationController: UINavigationController) {
        self.window.rootViewController = navigationController
    }
    
    func push(_ vcToNavigate: UIViewController) {
        guard let viewController = UIApplication.topViewController(window: window, controller: window.rootViewController), let navigationController = viewController.navigationController else { return }
        navigationController.pushViewController(vcToNavigate, animated: true)
    }
    
    func pop() {
        guard let viewController = UIApplication.topViewController(window: window, controller: window.rootViewController), let navigationController = viewController.navigationController else { return }
        navigationController.popViewController(animated: true)
    }

}

extension UIApplication {
    class func topViewController(window: UIWindow, controller: UIViewController?) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(window: window, controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(window: window, controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(window: window, controller: presented)
        }
        return controller
    }
}
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let ws = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: ws)
        
        let router = ToDoListRouter()
        let dataController = ToDoListDataController()
        let viewModel = ToDoListViewModel(dataController: dataController, router: router)
        let view = ToDoListVC(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: view)
        
        RoutingManager.shared.initialize(window: window)
        RoutingManager.shared.setRootViewController(navigationController)
        
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

