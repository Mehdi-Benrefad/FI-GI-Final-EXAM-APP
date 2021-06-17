//
//  IMC.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 17/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import Foundation
import UIKit

struct IMC {
    var poid = Float()
    var taille = Float()
    var evaluation: Float{
        get{
            return poid/pow(taille,2)
            
        }
    }
    
    var remarque: String {
        get{
            return message_couleur().0
        }
    }
    
    var couleur : UIColor{
        get{
            return message_couleur().1
        }
    }
    
    var icone : String{
        get{
            return message_couleur().2
        }
    }
    
    func message_couleur() -> (String,UIColor,String){
        var evaluation: Float{
            get{
                return poid/pow(taille,2)
            }
        }
        
        switch evaluation{
        case  0..<18,5:
            return ("Perte de poids inexpliquée, votre IMC =\(String(format: "%.2f",evaluation))",UIColor.black,"stop2")
        case  18,5..<25:
            return ("Poids normale, votre IMC =\(String(format: "%.2f",evaluation))",UIColor.systemGreen,"success")
        case 25..<30:
            return ("Surpoids, votre IMC =\(String(format: "%.2f",evaluation))",UIColor.systemYellow,"warning1")
        case 30..<35:
            return("Obésité modérée, votre IMC =\(String(format: "%.2f",evaluation))",UIColor.systemOrange,"warning2")
        case 35..<40:
            return("Obésité sévère, votre IMC =\(String(format: "%.2f",evaluation))",UIColor.systemRed,"warning3")
        default:
            return("Obésité massive, votre IMC =\(String(format: "%.2f",evaluation))",UIColor.black,"stop2")
        }
       
    }
}

