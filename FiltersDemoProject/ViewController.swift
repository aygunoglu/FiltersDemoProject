//
//  ViewController.swift
//  BlurringTest
//
//  Created by Hasan Aygünoglu on 2.08.2021.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    var context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "ProfileImage")
    }



    private func blurFilter(_ img: UIImage, intensity: Double) -> UIImage {
        
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: img)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(intensity, forKey: kCIInputRadiusKey)

        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")

        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        return processedImage
    }
    
    private func invertFilter(_ img: UIImage) -> UIImage {
        let startImage = CIImage(image: img)

        if let filter = CIFilter(name: "CIColorInvert") {
            filter.setValue(startImage, forKey: kCIInputImageKey)
            let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            let newImage = UIImage(cgImage: cgImage!)
            return newImage
        }
        return img
    }
    
    private func sepiaFilter(_ img: UIImage, intensity: Double) -> UIImage {
        let startImage = CIImage(image: img)

        if let filter = CIFilter(name: "CISepiaTone") {
            filter.setValue(startImage, forKey: kCIInputImageKey)
            filter.setValue(intensity, forKey: kCIInputIntensityKey)
            let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            let newImage = UIImage(cgImage: cgImage!)
            return newImage
        }
        return img
    }
    
    private func bloomFilter(_ img: UIImage, intensity: Double, radius: Double) -> UIImage {
        let startImage = CIImage(image: img)

        if let filter = CIFilter(name: "CIBloom") {
            filter.setValue(startImage, forKey: kCIInputImageKey)
            filter.setValue(intensity, forKey: kCIInputIntensityKey)
            filter.setValue(radius, forKey: kCIInputRadiusKey)
            //let context = CIContext(options: nil)
            let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            let newImage = UIImage(cgImage: cgImage!)
            return newImage
        }
        return img
    }
    
    private func grayscaleFilter(_ img: UIImage) -> UIImage {
        let startImage = CIImage(image: img)

        if let filter = CIFilter(name: "CIPhotoEffectNoir") {
            filter.setValue(startImage, forKey: kCIInputImageKey)
            let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
            let newImage = UIImage(cgImage: cgImage!)
            return newImage
        }
        return img
    }
    
    @IBAction func blurButton(_ sender: UIButton) {
        print("Blur Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.blurFilter(self.imageView.image!, intensity: 5)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
    @IBAction func invertButton(_ sender: UIButton) {
        print("Invert Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.invertFilter(self.imageView.image!)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
    @IBAction func sepiaButton(_ sender: UIButton) {
        print("Sepia Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.sepiaFilter(self.imageView.image!, intensity: 0.9)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
    @IBAction func bloomButton(_ sender: UIButton) {
        print("Bloom Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.bloomFilter(self.imageView.image!, intensity: 0.9, radius: 5)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
    @IBAction func grayscaleButton(_ sender: UIButton) {
        print("Grayscale Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.grayscaleFilter(self.imageView.image!)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
}

