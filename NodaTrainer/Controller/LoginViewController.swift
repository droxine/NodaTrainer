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

class LoginViewController: UIViewController, GIDSignInUIDelegate, LoginButtonDelegate {
    
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
        let facebookButton = FBLoginButton()
        //facebookButton.readPermissions = ["public_profile", "email", "user_friends"]
        facebookButton.frame = CGRect(x: 67, y: 580, width: view.frame.width - 132, height: 45)
        facebookButton.delegate = self
        view.addSubview(facebookButton)
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        if error != nil || !(result?.grantedPermissions.contains("public_profile"))!{
            print(error!)
            ProgressHUD.showError(error?.localizedDescription)
            AccessToken.current = nil
            LoginManager().logOut()
            return
        }
        
        print("Login with Facebook successfully, proceding with the credentials")
        
        let token = AccessToken.current
        if token != nil {
            let credential = FacebookAuthProvider.credential(withAccessToken: (token?.tokenString)!)
            Auth.auth().signIn(with: credential) { (user, error) in
                if error != nil {
                    print("No se asoció el usuario de Google con Firebase", error!)
                    ProgressHUD.showError(error?.localizedDescription)
                    AccessToken.current = nil
                    LoginManager().logOut()
                    return
                }
                
                guard let uid = user?.user.uid else {return}
                print("Facebook asociado con Firebase, para el usuario", uid)
                ProgressHUD.showSuccess("Conectado con Facebook")
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Facebook, log out")
        AccessToken.current = nil
        LoginManager().logOut()
        let deletepermission = GraphRequest(graphPath: "me/permissions/", parameters: [:], httpMethod: HTTPMethod(rawValue: "DELETE"))
        deletepermission.start(completionHandler: {(connection,result,error)-> Void in
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
        let alert = UIAlertController(title: "Vuelva a Intentar", message: message, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }

}
