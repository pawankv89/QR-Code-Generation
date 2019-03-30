//
//  ViewController.swift
//  QR Code Generation
//
//  Created by Pawan kumar on 29/03/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var qrCodeTextField: UITextField!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var qrCodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        self.qrCodeTextField.delegate = self
        
    }
    
    // MARK: QRCode Button Tap
    
    @IBAction func qrCodeButtonTap(_ sender: UIButton) {

        //String
        var absoluteString = ""
        
        if self.qrCodeTextField.text!.isEmpty {
            //String
            absoluteString = "https://github.com/pawankv89"
            self.qrCodeTextField.text = absoluteString
        } else {
            //String
            absoluteString = self.qrCodeTextField.text!
        }
        
        //Hide Keyboard
        self.qrCodeTextField.resignFirstResponder()
        
        //Image
        qrCodeImageView.image = self.generateQRCodeImage(qrCodeString: absoluteString)
        
    }

    func generateQRCodeImage(qrCodeString: String) -> UIImage {
        
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return UIImage.init()}
        let qrData = qrCodeString.data(using: String.Encoding.ascii)
        qrFilter.setValue(qrData, forKey: "inputMessage")
        let qrTransform = CGAffineTransform(scaleX: 12, y: 12)
        let qrImage = qrFilter.outputImage?.transformed(by: qrTransform)
        let qrCodeImage: UIImage = UIImage.init(ciImage: qrImage!)
        return qrCodeImage
    }
    
}

