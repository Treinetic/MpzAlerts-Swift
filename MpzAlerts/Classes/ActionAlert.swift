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
        
        @IBOutlet weak var container: UIView!
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var messageLabel: UILabel!
        @IBOutlet weak var buttonStack: UIStackView!
        
        public override init(frame: CGRect) {
            super.init(frame: frame)
            initializeView()
        }
        
        public required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initializeView()
        }
        
        override open func initializeView() {
            let nib = UINib(nibName: "ActionAlertView", bundle: Bundle.init(for: type(of: self)))
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            self.view = view
        }
        
        override open func build() {
            buildContainer(view: self.container)
            buildTitleLabel(label: self.titleLabel)
            buildMessageLabel(label: self.messageLabel)
            self.titleLabel.textAlignment = self.configs.actionAlertTitleAlign
            self.messageLabel.textAlignment = self.configs.actionAlertMessageAlign
            buttonStack.subviews.forEach({$0.removeFromSuperview()})
            for button in buttons {
                let b = ActionAlertButtonView.init(fromAlertButton: button)
                buttonStack.addArrangedSubview(b.build())
            }
        }
        
    }
}
