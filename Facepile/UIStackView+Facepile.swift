//
//  UIStackView+Facepile.swift
//  Facepile
//
//  Created by Marek Hac on 24/01/2023.
//

import Foundation
import UIKit

struct FacepileConfiguration {
    
    // default values
    
    var size: CGFloat
    var overlapping: CGFloat
    var fontSize: CGFloat
    var maxFacesToDisplay: Int
    
    init(size: CGFloat = 40, overlapping: CGFloat = 0.6, fontSize: CGFloat = 17, maxFacesToDisplay: Int = 5) {
        self.size = size
        self.overlapping = overlapping
        self.fontSize = fontSize
        self.maxFacesToDisplay = maxFacesToDisplay
    }
}

extension UIStackView {
    
    func show(faces: [String], config: FacepileConfiguration) {
                
        var numberOfFaces = 0
        let remainFaces = faces.count - config.maxFacesToDisplay
        
        // setup custom spacing
        
        self.spacing = config.size * config.overlapping * -1
        
        if remainFaces <= 0 {
            numberOfFaces = faces.count - 1
        } else {
            numberOfFaces = config.maxFacesToDisplay - 1
        }
        
        if config.maxFacesToDisplay == 0 {
            print("[ERROR] maxFacesToDisplay must be a non-zero value")
            return
        }
                
        // loop through faces
        
        for i in 0...numberOfFaces  {
            let image = UIImage(named: faces[i])
            let faceView = FaceView()
            faceView.faceImageView.image = image
            
            // custom size
            
            faceView.heightContraint.constant = config.size
            faceView.widthContraint.constant = config.size
            faceView.faceImageView.layer.cornerRadius = config.size / 2
            faceView.faceImageView.layer.borderWidth = 4
            faceView.faceImageView.layer.borderColor = UIColor.white.cgColor
        
            self.addArrangedSubview(faceView)
        }
        
        // last image with red dot and number of remaining faces
        
        if remainFaces > 0 {
            let remainFacesView = RemainFacesView()
            
            remainFacesView.layer.cornerRadius = config.size / 2
            remainFacesView.layer.borderWidth = 4
            remainFacesView.layer.borderColor = UIColor.white.cgColor
            
            remainFacesView.number.font = UIFont.systemFont(ofSize: config.fontSize)
            remainFacesView.number.text = "+" + String(remainFaces)

            self.addArrangedSubview(remainFacesView)
        }
    }
}
