//
//  ObjectNameViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 17/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import CoreML
import Vision
import AVFoundation

class ObjectNameViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
     @IBOutlet weak var imageSelect: UIImageView!
       @IBOutlet weak var prediction: UILabel!
       let imagePicker = UIImagePickerController()
        var resultToVoice = ""
    
       override func viewDidLoad() {
           super.viewDidLoad()

           //definir le viewController en tant que delegate de l'image picker
           imagePicker.delegate = self
           //definir la source de l'image
           imagePicker.sourceType = .photoLibrary
           imagePicker.allowsEditing = false
       }
       
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           //on verifie si l'utilisateur a selectionne une image correctement
            if let userPickerImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                       imageSelect.image = userPickerImage
                       guard let ciimage = CIImage(image: userPickerImage) else {
                           fatalError("Failed to convert UI image to ciimage")
                       }
               Detect(image: ciimage)
           }
            imagePicker.dismiss(animated: true, completion: nil)
       }
    
    @IBAction func speak(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: resultToVoice)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.1

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
       func Detect(image:CIImage){
           //recuperer le modele
                  guard   let model = try? VNCoreMLModel(for: MobileNetV2().model) else{
                                 fatalError("Core ML loading failed")
                         }
                          
           //tester si la requette a reussi ou non
                   let request = VNCoreMLRequest(model: model ) {   (request, error ) in
                       guard let results = request.results as? [VNClassificationObservation] else {
                           fatalError("Core ML process failed")
                       }
                           
                       //recuperer le premier resultat
                       if let fisrtresult = results.first {
                           self.prediction.text = fisrtresult.identifier
                        self.resultToVoice = fisrtresult.identifier
                                     
                       }
                   }
                         
                       //envoi d'une ou de plusieurs requettes sur l'image
                         let handler = VNImageRequestHandler(ciImage: image)
                            do {
                                try handler.perform([request])
                            } catch {
                                print("Failed to perform classification.\n\(error.localizedDescription)")
                            }
                         
       }
       
       @IBAction func cameraBTN(_ sender: Any) {
           imagePicker.modalPresentationStyle = .fullScreen
           present(imagePicker,animated: true,completion: nil)
       }
       
}
