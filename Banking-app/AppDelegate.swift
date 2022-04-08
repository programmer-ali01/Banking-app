//
//  AppDelegate.swift
//  Banking-app
//
//  Created by Alisena Mudaber on 4/8/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let onBoarding = OnboardingViewController()
    let loginViewController = LoginViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
   
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
        
        loginViewController.delegate = self
        
        return true
    }
    
    private func displayNextScreen() {
//        if LocalState.hasOnboarded {
//            prepMainView()
//            setRootViewController(mainViewController)
//        } else {
//            setRootViewController(onboardingContainerViewController)
//        }
        setRootViewController(onBoarding)
    }




}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}

extension AppDelegate: LogoutDelegate {
    @objc func didLogout() {
         setRootViewController(ViewController())
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.7,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

