//
//  RemainFacesView.swift
//
//  Created by Marek Hac on 19/05/2021.
//

import UIKit
import Foundation

@IBDesignable
class RemainFacesView: UIView {
    
    @IBOutlet weak var number: UILabel!
    
    var contentView:UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }
 
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setupThisView()
     }
 
     override init(frame: CGRect) {
         super.init(frame: frame)
         setupThisView()
     }
 
     override func prepareForInterfaceBuilder() {
         super.prepareForInterfaceBuilder()
         setupThisView()
         contentView?.prepareForInterfaceBuilder()
     }
 
     // Lifecycle methods
 
     private func setupThisView(){
         guard let view = loadViewFromNib() else { return }
         view.frame = bounds
         view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         addSubview(view)
         contentView = view
     }
 
     func loadViewFromNib() -> UIView? {
         let nibName = String(describing: RemainFacesView.self)
         let bundle = Bundle(for: type(of: self))
         let nib = UINib(nibName: nibName, bundle: bundle)
         return nib.instantiate(withOwner: self,options: nil).first as? UIView
     }
}




