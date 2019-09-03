//
//  ImageAlert.swift
//  MD Gunasena
//
//  Created by Treinetic-Macbook on 2/20/19.
//  Copyright © 2019 Treinetic PVT LTD. All rights reserved.
//

import Foundation
import UIKit
import QuickLayout


extension MpzAlerts {
    
    open class ImageAlert : MpzAlerts {
        
        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var messageLabel: UILabel!
        @IBOutlet weak var buttonStack: UIStackView!
        
        override func loadViewFromXib() -> UIView{
            let nib = UINib(nibName: "ImageAlert", bundle: Bundle.init(for: type(of: self)))
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            return view
        }
        
        override func build() {
            titleLabel.text = self.title
            messageLabel.text = self.message
            imageView.image = self.image
            titleLabel.font = self.configs.titleFont
            messageLabel.font = self.configs.messageFont
            buttonStack.subviews.forEach({$0.removeFromSuperview()})
            for button in buttons {
                let b = ActionAlertButtonView.init(fromAlertButton: button)
                buttonStack.addArrangedSubview(b.build())
            }
        }
    }
}
