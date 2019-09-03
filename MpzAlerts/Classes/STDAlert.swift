//
//  STDAlertView.swift
//  MD Gunasena
//
//  Created by Treinetic-Macbook on 1/28/19.
//  Copyright © 2019 Treinetic PVT LTD. All rights reserved.
//

import UIKit
import SwiftEntryKit

extension MpzAlerts {
    open class STDAlert : MpzAlerts {
        
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var messageLabel: UILabel!
        @IBOutlet weak var buttonStack: UIStackView!
        
   
        @IBOutlet weak var containerRightCon: NSLayoutConstraint!
        @IBOutlet weak var containerLeftCon: NSLayoutConstraint!
        
        
        override func loadViewFromXib() -> UIView{
            let nib = UINib(nibName: "STDAlertView", bundle: Bundle.init(for: type(of: self)))
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            return view
        }
        
        public static func show(title : String, message : String, button : String, handler : (() -> ())?) {
            let _ = STDAlert().setTitle(title).setMessage(message).addButton(button, handler: handler).show()
        }
        
        override open func build() {
            titleLabel.text = self.title
            messageLabel.text = self.message
            titleLabel.font = self.configs.titleFont
            messageLabel.font = self.configs.messageFont
            buttonStack.subviews.forEach({$0.removeFromSuperview()})
            for button in buttons {
                let b = button.getButton()
                buttonStack.addArrangedSubview(b)
            }
        }

    }
}
