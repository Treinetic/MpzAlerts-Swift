//
//  ActionButton.swift
//  MpzAlerts
//
//  Created by Hasitha Mapalagama on 9/3/19.
//

import Foundation
import UIKit
extension MpzAlerts {
    public class AlertButton {
        
        var text : String!
        var buttonType : ButtonType = .text
        var color : UIColor!
        var config : Configs!
        var image : UIImage?
        var handler : (() -> ())?
        
        
        public init(text : String, image: UIImage?, buttonType : ButtonType, color : UIColor, configs : Configs, handler : (() -> ())?) {
            self.handler = handler
            self.text = text
            self.config = configs
            self.buttonType = buttonType
            self.color = color
            self.image = image
        }

        
        
        open func getButton() -> UIButton {
            let button = UIButton()
            button.setTitle(self.text, for: .normal)
            button.layer.cornerRadius = config.buttonCornerRadius
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            button.titleLabel?.font = config.buttonFont
            switch self.buttonType {
            case .fill:
                button.backgroundColor = color
                button.setTitleColor(.white, for: .normal)
                break
            case .text:
                button.setTitleColor(color, for: .normal)
                button.backgroundColor = .white
                break
            }
            button.addTarget(self, action: #selector(self.didClick), for: .touchUpInside)
            return button
        }
        
        
        @objc func didClick() {
            handler?()
        }
    }
}
