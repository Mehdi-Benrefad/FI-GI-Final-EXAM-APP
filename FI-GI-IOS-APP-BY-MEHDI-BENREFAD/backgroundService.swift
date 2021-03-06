//
//  backgroundService.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 16/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import Foundation

class backgroundService{
    
    static var color : String {
    
        get{
            return UserDefaults.standard.string(forKey: "color") ?? "white"
        }
        
        set{
            UserDefaults.standard.set(newValue, forKey: "color")
        }
    }
}
