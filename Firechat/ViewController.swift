//
//  ViewController.swift
//  Firechat
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    //let fbaseMgr = FirebaseManager()
    
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    
    @IBAction func signOut(_ sender: UIButton) {
        //guard let email = emailOutlet.text else { fatalError("Invalid email")  }
        //guard let password = passwordOutlet.text else { fatalError("Invalid password")  }
        
        FirebaseManager.signOut() { (signOutBool) in
            if signOutBool {
                print("SignOut successful")
            } else {
                print("SignOut failed")
            }
        }
        
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        guard let email = emailOutlet.text else { fatalError("Invalid email")  }
        guard let password = passwordOutlet.text else { fatalError("Invalid password")  }
            
        FirebaseManager.signUp(email: email, password: password, completion: { (user, errorBool) in
            
            if (errorBool == true) {
                print("Sign Up successful")
            } else {
                print("Sign Up failed" , user.debugDescription)
            }
        
        })  //FirebaseManager.signUp
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        guard let email = emailOutlet.text else { fatalError("Invalid email")  }
        guard let password = passwordOutlet.text else { fatalError("Invalid password")  }
        
        FirebaseManager.login(email: email, password: password ) { (user, loginBool) in

            if (loginBool == true) {
                print("Login successful")
            } else {
                print("Login failed" , user.debugDescription)
            }
    
        }
    }
    
    
    @IBAction func resetPassword(_ sender: UIButton) {
        
        guard let email = emailOutlet.text else { fatalError("Invalid email")  }
        
        FirebaseManager.resetPassword(email: email) { (result) in
            if result {
                print("Password reset successful")
            } else {
                print("Password reset failed")
            }
        }
    }
    
    var handle: FIRAuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            // ...
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        FIRAuth.auth()?.removeStateDidChangeListener(handle!)
    }
   
}
