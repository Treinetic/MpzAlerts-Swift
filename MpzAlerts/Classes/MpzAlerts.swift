//
//  MpzAlertsConfigs.swift
//  MpzAlerts
//
//  Created by Hasitha Mapalagama on 9/2/19.
//

import Foundation
import UIKit
import SwiftEntryKit
public class MpzAlerts : UIView {
    
 
    public enum ButtonType {
        case fill
        case text
    }
    
    public enum Position {
        case top
        case bottom
        case center
        case left
        case right
    }
    
    public class Configs {
        
        public var primaryColor : UIColor = .red
        public var secondaryColor : UIColor = .blue
        public var titleColor : UIColor = .black
        public var bodyTextColor : UIColor = .gray
        public var backgroundColor : UIColor = .white
        public var dimColor : UIColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        public var cornerRadius = CGFloat(10)
        public var buttonFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        public var titleFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        public var messageFont = UIFont.systemFont(ofSize: 15, weight: .regular)
        public var buttonCornerRadius = CGFloat(22)
        public var position : Position = .center
        public var buttonPosition: Position = .right
        public var actionAlertButtonPosition: Position = .center
        public var padding = CGFloat(0)
        public var maxWidth = CGFloat(400)
        public var tapToHide = true
        
        public static var defaultConfigs = Configs()
    }
    
    public var view : UIView!
    public var title : String?
    public var message : String?
    public var alertTag : String?
    public var image: UIImage?
    public var buttons  = [MpzAlerts.AlertButton]()
    private var shownAlerts = Dictionary<String, Bool>()
    public var configs: MpzAlerts.Configs = MpzAlerts.Configs.defaultConfigs
    
    public convenience init(configs : MpzAlerts.Configs = MpzAlerts.Configs.defaultConfigs) {
        self.init()
        self.configs = configs
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
        print("view initialize")
        view = loadViewFromXib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromXib() -> UIView {
        return UIView()
    }
    
    public func setTitle(_ text : String) -> MpzAlerts {
        self.title = text
        return self
    }
    
    public func setMessage(_ text : String) -> MpzAlerts {
        self.message = text
        return self
    }
    
    public func setTag(_ text : String) -> MpzAlerts {
        self.alertTag = text
        return self
    }
    
    public func setImage(_ image : UIImage) -> MpzAlerts {
        self.image = image
        return self
    }
    
    
    public func addButton(_ text : String, color : UIColor? = nil, type: ButtonType? = nil,
                          image: UIImage? = nil, handler: (() -> Void)?) -> MpzAlerts {
        let btn = MpzAlerts.AlertButton.init(text: text,
                                             image: image,
                                             buttonType: type ?? .text,
                                             color: color ?? configs.secondaryColor,
                                             configs: configs,
                                             handler: {
                                                self.hide()
                                                handler?()
                                                
                                                
        })
        self.buttons.append(btn)
        return self
    }
    
    public func show() {
        self.build()
        var ekAttributes = EKAttributes()
        switch configs.position {
            case .center: ekAttributes.position = .center
            case .bottom: ekAttributes.position = .bottom
            case .top: ekAttributes.position = .top
        default: ekAttributes.position = .center
        }
        ekAttributes.displayDuration = .infinity
        if self.configs.tapToHide {
            ekAttributes.screenInteraction = .dismiss
        } else {
            ekAttributes.screenInteraction = .absorbTouches
        }
        ekAttributes.screenBackground = .color(color: EKColor.init(configs.dimColor))
        ekAttributes.entryInteraction = .forward
        ekAttributes.scroll = .disabled
        if configs.position != .bottom && configs.position != .top {
            ekAttributes.positionConstraints = .init(
                verticalOffset: 0,
                size: .init(width: .offset(value: self.configs.padding), height: .intrinsic),
                maxSize: .init(width: .constant(value: self.configs.maxWidth), height: .intrinsic)
            )
        }
        ekAttributes.positionConstraints.safeArea = .overridden
        SwiftEntryKit.display(entry: self.view!, using: ekAttributes)
    }
    
    func hide() {
        SwiftEntryKit.dismiss()
        if let tg = alertTag {
            shownAlerts[tg] = false
        }
    }
    
    func build() {
        
    }

    
}

