//
//  IMCResultViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 17/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class IMCResultViewController: UIViewController {

   @IBOutlet weak var icone: UIImageView!
    @IBOutlet var viewResult: UIView!
    @IBOutlet weak var resultText: UILabel!
    var imc = IMC()
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(imc)
        resultText.text = imc.remarque
        viewResult.backgroundColor=imc.couleur
        // Do any additional setup after loading the view.
       icone.image = UIImage(named: imc.icone)
        
        
    }
}
