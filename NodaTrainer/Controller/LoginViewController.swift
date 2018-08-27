//
//  LoginViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 4/29/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class LoginViewController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var viewSocialButtons: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSocialButtons.layer.cornerRadius = 12
        viewSocialButtons.clipsToBounds = true
        setupGoogleButton()
        setupFacebookButton()
    }
    
    //Creating and configuring the Google Sign In Button
    fileprivate func setupGoogleButton() {
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 162, y: 477, width: 71, height: 30)
        googleButton.style = GIDSignInButtonStyle.iconOnly
        view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    fileprivate func setupFacebookButton() {
        let facebookButton = FBSDKLoginButton()
        facebookButton.readPermissions = ["public_profile", "email", "user_friends"]
        facebookButton.frame = CGRect(x: 67, y: 580, width: view.frame.width - 132, height: 45)
        facebookButton.delegate = self
        view.addSubview(facebookButton)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            ProgressHUD.showError(error.localizedDescription)
            FBSDKAccessToken.setCurrent(nil)
            FBSDKLoginManager().logOut()
            return
        }
        
        print("Login with Facebook successfully, proceding with the credentials")
        
        let token = FBSDKAccessToken.current()
        let credential = FacebookAuthProvider.credential(withAccessToken: (token?.tokenString)!)
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("No se asoció el usuario de Google con Firebase", error)
                ProgressHUD.showError(error?.localizedDescription)
                FBSDKAccessToken.setCurrent(nil)
                FBSDKLoginManager().logOut()
                return
            }
            
            guard let uid = user?.uid else {return}
            print("Facebook asociado con Firebase, para el usuario", uid)
            ProgressHUD.showSuccess("Conectado con Facebook")
        }

    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Facebook, log out")
        FBSDKAccessToken.setCurrent(nil)
        FBSDKLoginManager().logOut()
        let deletepermission = FBSDKGraphRequest(graphPath: "me/permissions/", parameters: nil, httpMethod: "DELETE")
        deletepermission?.start(completionHandler: {(connection,result,error)-> Void in
            print("the delete permission is (result)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func iniciarSesion(_ sender: Any) {
        let userEmail = txtEmail.text
        let userPasword = txtPassword.text
        
        if((userEmail?.isEmpty)! || (userPasword?.isEmpty)!) {
            displayAlertMessage(message: "Ingrese todos los campos");
            return;
        }
        
        Auth.auth().signIn(withEmail: userEmail!, password: userPasword!) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                self.displayAlertMessage(message: "Datos Incorrectos")
            }
        }
    }
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessage(message:String) {
        let alert = UIAlertController(title: "Vuelva a Intentar", message: message, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }

}
