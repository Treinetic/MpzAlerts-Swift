//
//  ActionAlert.swift
//  MD Gunasena
//
//  Created by Treinetic-Macbook on 2/5/19.
//  Copyright © 2019 Treinetic PVT LTD. All rights reserved.
//


import UIKit
import SwiftEntryKit

extension MpzAlerts {
    open class ActionAlert : MpzAlerts {
        
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var messageLabel: UILabel!
        @IBOutlet weak var buttonStack: UIStackView!
        
        override func loadViewFromXib() -> UIView{
            let nib = UINib(nibName: "ActionAlertView", bundle: Bundle.init(for: type(of: self)))
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            return view
        }
        
        override open func build() {
            titleLabel.text = self.title
            messageLabel.text = self.message
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
