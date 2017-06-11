//
//  DataStore.swift
//  AsherDemo
//
//  Created by Brian Clouser on 6/9/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    let shared = DataStore()
    var clients : [Client] = []
    
    override init() {
        super.init()
        
        
    }
    
    func checkForFirstTime() {
        if UserDefaults.standard.value(forKey: "userExists") != nil {
            //fetch
        } else {
            createClient()
        }
    }
    
    func createUser() {
        UserDefaults.standard.set(true, forKey: "userExists")
        
        
        
        
    }
    
    
    

}
