//
//  ViewController.swift
//  Facepile
//
//  Created by Marek Hac on 23/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var imageSize: CGFloat = 40
    var overlapping: CGFloat = 0.5
    var fontSize: CGFloat = 13
    
    @IBOutlet weak var imageSizeValueLabel: UILabel!
    @IBOutlet weak var overlappingValueLabel: UILabel!
    @IBOutlet weak var fontsizeValueLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    let faces = ["facepile1.png", "facepile2.png", "facepile3.png", "facepile4.png", "facepile5.png", "facepile6.png",
                 "facepile1.png", "facepile2.png", "facepile3.png", "facepile4.png", "facepile5.png", "facepile6.png",
                 "facepile1.png", "facepile2.png", "facepile3.png", "facepile4.png", "facepile5.png", "facepile6.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let facepileConfiguration = FacepileConfiguration(size: self.imageSize,
                                                          overlapping: self.overlapping,
                                                          fontSize: self.fontSize)
        
        self.stackView.show(faces: faces, config: facepileConfiguration)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupBackground()
    }
    
    @IBAction func imageSizeSliderValueChanged(_ sender: UISlider) {
        self.imageSize = CGFloat(sender.value)
        self.imageSizeValueLabel.text = String.init(format: "%.02f", sender.value)

        self.reloadFacepileStackView()
    }
        
    @IBAction func overlappingSliderValueChanged(_ sender: UISlider) {
        self.overlapping = CGFloat(sender.value)
        self.overlappingValueLabel.text = String.init(format: "%.02f", sender.value)

        self.reloadFacepileStackView()
    }
    
    @IBAction func fontSizeSliderValueChanged(_ sender: UISlider) {
        self.fontSize = CGFloat(sender.value)
        self.fontsizeValueLabel.text = String(Int(sender.value))

        self.reloadFacepileStackView()
    }
 
    private func reloadFacepileStackView() {
        self.stackView.removeAllSubviewsFromStackView()
        
        let facepileConfiguration = FacepileConfiguration(size: self.imageSize,
                                                          overlapping: self.overlapping,
                                                          fontSize: self.fontSize)
        self.stackView.show(faces: faces, config: facepileConfiguration)
    }
    
    private func setupBackground() {
        UIGraphicsBeginImageContext(view.frame.size)
        UIImage(named: "background.png")?.draw(in: self.view.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        view.backgroundColor = UIColor.init(patternImage: image!)
    }
}

extension UIStackView {
    public func removeAllSubviewsFromStackView() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}

