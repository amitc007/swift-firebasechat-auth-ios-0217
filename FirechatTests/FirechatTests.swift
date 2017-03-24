//
//  FirechatTests.swift
//  FirechatTests
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import XCTest
import Pods_Firechat


@testable import Firechat

class FirechatTests: XCTestCase {
    
    let emailString = ""
    
    override func setUp() {
        super.setUp()
        
        
        
        
        
        
        
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testSignUp() {
        let exp = expectation(description: "signUp")
        let email = randomEmail(length: 8) + "@example.com"
        FirebaseManager.signUp(email: email, password: "flatiron") { (user, success) in
            XCTAssertTrue(success, "Login Success")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 25) { (error) in
            if error != nil {
                
            }
            
        }

        
    }
    
    func testSignIn() {
        let exp = expectation(description: "signIn")
        let email = randomEmail(length: 8) + "@example.com"
        FirebaseManager.signUp(email: email, password: "flatiron") { (user, success) in
            XCTAssertTrue(success, "Login Success")
            FirebaseManager.logOut(completion: { (success) in
                XCTAssertTrue(success, "Logged out")
                
                
                FirebaseManager.login(email: email, password: "flatiron", completion: { (user, success) in
                    XCTAssertTrue(success, "Logged in")
                    exp.fulfill()
                })
            })
        }
        
        waitForExpectations(timeout: 25) { (error) in
            if error != nil {
                
            }
            
        }
    }

    
    func randomEmail(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyz0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
    

}
