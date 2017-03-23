//
//  FirebaseManager.swift
//  Firechat
//
//  Created by Johann Kerr on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseManager {
    
    class func login(email: String, password:String, completion: @escaping (FIRUser?, Bool) -> ()) {
       
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
         
            if error == nil {
                completion(user, true)
            } else {
                completion(user, false)
            }
        }
        
    }
    
    class func signUp(email: String, password:String ,completion: @escaping (FIRUser?, Bool) -> ()) {
       
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                completion(user, true)
            } else {
                completion(user, false)
            }
        }
        
    }
    

    class func resetPassword(email: String, completion: @escaping ( Bool) -> ()) {
        
        
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
            
        })
        
    }

    
    
    class func signOut(completion: @escaping (Bool) -> ()) {

        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            completion(true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            completion(false)
        }
        
    }
    
    
}

