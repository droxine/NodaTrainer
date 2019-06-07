//
//  AppDelegate.swift
//  NodaTrainer
//
//  Created by sangeles on 4/15/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        //testing
        //let myDatabase = Database.database().reference()
        //myDatabase.setValue("Data on")
        
        //Initializing Google identifier
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        //Initializing Facebook
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //Handling Auth State: For Later
        _ = Auth.auth().addStateDidChangeListener { auth, user in
            self.userFlow(signedIn: user != nil)
            //let storyboard = UIStoryboard(name: "Main", bundle: nil)
            /*if user != nil {
                let controller = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
            } else {
                 //Go HomeView, so the user can login/register
                let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
            }*/
        }
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print("Error al iniciar con Google", error)
            return
        }
        
        print("Logueado con Google!", user)
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("No se asoció el usuario de Google con Firebase")
            }
            
            guard let uid = user?.user.uid else {return}
            print("Google asociado con Firebase, para el usuario", uid)
            ProgressHUD.showSuccess("Conectado con Google")
            self.userFlow(signedIn: error == nil)
        }
    }
    
    fileprivate func userFlow(signedIn : Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if signedIn {
            let controller = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
            self.window?.rootViewController = controller
            self.window?.makeKeyAndVisible()
        } else {
            //Go HomeView, so the user can login/register
            let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.window?.rootViewController = controller
            self.window?.makeKeyAndVisible()
        }
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let signInMethod = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        GIDSignIn.sharedInstance().handle(url,
                                          sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: [:])
        return signInMethod
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

