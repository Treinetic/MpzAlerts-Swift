//
//  ActionAlertButtonView.swift
//  MD Gunasena
//
//  Created by Treinetic-Macbook on 2/5/19.
//  Copyright © 2019 Treinetic PVT LTD. All rights reserved.
//

import Foundation
import UIKit
class ActionAlertButtonView : UIView {
    
    var view : UIView!

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    var alertButton : MpzAlerts.AlertButton!
    
    public convenience init(fromAlertButton button : MpzAlerts.AlertButton) {
        self.init()
        self.alertButton = button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _viewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _viewSetup()
    }
    
    private func _viewSetup() {
        view = loadViewFromXib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    open func build() -> ActionAlertButtonView {
        if let img = self.alertButton.image {
            self.image.image = img
        }else{
            self.image.isHidden = true
        }
        self.text.text = self.alertButton.text
        self.text.textColor = self.alertButton.color
        self.text.font = self.alertButton.config.buttonFont
        switch alertButton.config.actionAlertButtonPosition {
            case .center: self.text.textAlignment = .center
            case .left: self.text.textAlignment = .left
            case .right: self.text.textAlignment = .right
            default: self.text.textAlignment = .center
        }
        return self
    }
    
    private func loadViewFromXib() -> UIView{
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    @IBAction func didClick(_ sender: Any) {
        self.alertButton.handler?()
    }
    
    
}
