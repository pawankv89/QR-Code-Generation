
QR Code Generation
=========

## A demo app for QR Code Generation, in Swift 5.
------------
 Added Some screens here.
 
![](https://github.com/pawankv89/QR-Code-Generation/blob/master/images/screen_1.png)
![](https://github.com/pawankv89/QR-Code-Generation/blob/master/images/screen_2.jpeg)




## Usage
------------
 
Integration Steps

```swift

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

```

There is a sample function in ViewController that you can simply call. 

```swift
func generateQRCodeImage(qrCodeString: String) -> UIImage {

guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return UIImage.init()}
let qrData = qrCodeString.data(using: String.Encoding.ascii)
qrFilter.setValue(qrData, forKey: "inputMessage")
let qrTransform = CGAffineTransform(scaleX: 12, y: 12)
let qrImage = qrFilter.outputImage?.transformed(by: qrTransform)
let qrCodeImage: UIImage = UIImage.init(ciImage: qrImage!)
return qrCodeImage
}
```
## For Refrences

[](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIQRCodeGenerator)

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
