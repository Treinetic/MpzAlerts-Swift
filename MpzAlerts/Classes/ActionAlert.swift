//
//  ActionAlert.swift
//  MD Gunasena
//
//  Created by Treinetic-Macbook on 2/5/19.
//  Copyright © 2019 Treinetic PVT LTD. All rights reserved.
//


import UIKit
import SwiftEntryKit

//class ActionAlertButton {
//    var view : UIView!
//
//    init(text: String, icon: UIImage, color: UIColor, handler: (() -> ())?) {
//        let actionButton = ActionAlertButtonView()
//        actionButton.text.text = text
//        actionButton.image.image = icon
//        actionButton.handler = handler
//        view = actionButton
//    }
//
//}
//

extension MpzAlerts {
    public class ActionAlert : MpzAlerts {
        
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var messageLabel: UILabel!
        @IBOutlet weak var buttonStack: UIStackView!
        
        override func loadViewFromXib() -> UIView{
            let nib = UINib(nibName: "ActionAlertView", bundle: Bundle.init(for: type(of: self)))
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            return view
        }
        
        override func build() {
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
