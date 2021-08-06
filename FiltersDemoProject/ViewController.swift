//
//  ViewController.swift
//  BlurringTest
//
//  Created by Hasan Aygünoglu on 2.08.2021.
//

import UIKit
import BasicFilters

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    let basicFilters = BasicFilters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "ProfileImage")
        
    }
    
    @IBAction func blurButton(_ sender: UIButton) {
        print("Blur Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.basicFilters.blurFilter(self.imageView.image!, intensity: 5)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
    @IBAction func invertButton(_ sender: UIButton) {
        print("Invert Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.basicFilters.invertFilter(self.imageView.image!)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
    @IBAction func sepiaButton(_ sender: UIButton) {
        print("Sepia Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.basicFilters.sepiaFilter(self.imageView.image!, intensity: 0.9)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
    @IBAction func bloomButton(_ sender: UIButton) {
        print("Bloom Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.basicFilters.bloomFilter(self.imageView.image!, intensity: 0.9, radius: 5)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
    @IBAction func grayscaleButton(_ sender: UIButton) {
        print("Grayscale Button Pressed")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let processsedImg = self.basicFilters.grayscaleFilter(self.imageView.image!)
            DispatchQueue.main.async {
                self.imageView.image = processsedImg
            }
        }
    }
    
}

