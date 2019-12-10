//
//  MpzAlertsConfigs.swift
//  MpzAlerts
//
//  Created by Hasitha Mapalagama on 9/2/19.
//

import Foundation
import UIKit
import SwiftEntryKit
open class MpzAlerts : UIView {
    
 
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
    
    public struct Configs {
        
        public var primaryColor : UIColor = UIColor(red:0.16, green:0.48, blue:0.78, alpha:1.0)
        public var secondaryColor : UIColor = UIColor(red:0.46, green:0.45, blue:0.45, alpha:1.0)
        public var titleColor : UIColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
        public var messageColor : UIColor = UIColor(red:0.45, green:0.45, blue:0.45, alpha:1.0)
        public var backgroundColor : UIColor = .white
        public var dimColor : UIColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)
        public var cornerRadius = CGFloat(0)
        public var titleAlign : NSTextAlignment = .left
        public var messageAlign : NSTextAlignment = .left
        public var actionAlertTitleAlign : NSTextAlignment = .center
        public var actionAlertMessageAlign : NSTextAlignment = .center
        public var imageAlertTitleAlign : NSTextAlignment = .center
        public var imageAlertMessageAlign : NSTextAlignment = .center
        public var datePickerAlertTitleAlign : NSTextAlignment = .center
        public var buttonFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        public var titleFont = UIFont.systemFont(ofSize: 18, weight: .bold)
        public var messageFont = UIFont.systemFont(ofSize: 15, weight: .regular)
        public var buttonCornerRadius = CGFloat(22)
        public var position : Position = .center
        public var buttonPosition: Position = .right
        public var actionAlertButtonPosition: Position = .center
        public var horizontalPadding = CGFloat(20)
        public var verticalPadding : CGFloat?
        public var maxWidth = CGFloat(400)
        public var maxHeight = CGFloat(Int.max)
        public var tapToHide = true
        public var entranceAnimation : EKAttributes.Animation = .init( translate: .none,
                                                                       scale: .init(from: 0.5, to: 1, duration: 0.2),
                                                                       fade: .init(from: 0, to: 1, duration: 0.1))
        public var exitAnimation : EKAttributes.Animation = .init( translate: .none,
                                                                   scale: .init(from: 1, to: 0.5, duration: 0.2),
                                                                   fade: .init(from: 1, to: 0, duration: 0.2))
        
        
        public var snackBarBackgroundColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
        public var snackBarTextColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)

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
    
    public convenience init(withView view : UIView, configs : MpzAlerts.Configs = MpzAlerts.Configs.defaultConfigs) {
        self.init()
        self.configs = configs
        self.view = view
    }
    
    open func initializeView() {
        
    }
    
    open func setTitle(_ text : String) -> MpzAlerts {
        self.title = text
        return self
    }
    
    open func setMessage(_ text : String) -> MpzAlerts {
        self.message = text
        return self
    }
    
    open func setTag(_ text : String) -> MpzAlerts {
        self.alertTag = text
        return self
    }
    
    open func setImage(_ image : UIImage) -> MpzAlerts {
        self.image = image
        return self
    }
    
    
    open func addButton(_ text : String, color : UIColor? = nil, type: ButtonType? = nil,
                          image: UIImage? = nil, handler: (() -> Void)?) -> MpzAlerts {
        let btn = MpzAlerts.AlertButton.init(text: text,
                                             image: image,
                                             buttonType: type ?? .text,
                                             color: color ?? configs.primaryColor,
                                             configs: configs,
                                             handler: {
                                                self.hide()
                                                handler?()
                                                
                                                
        })
        self.buttons.append(btn)
        return self
    }
    
    open func show() {
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
            var heightConstrain = EKAttributes.PositionConstraints.Edge.intrinsic
            if let verticalPadding = self.configs.verticalPadding {
                heightConstrain = .offset(value: verticalPadding)
            }
            ekAttributes.positionConstraints = .init(
                verticalOffset: 0,
                size: .init(width: .offset(value: self.configs.horizontalPadding), height: heightConstrain),
                maxSize: .init(width: .constant(value: self.configs.maxWidth), height: .constant(value: self.configs.maxHeight))
            )
        }
        ekAttributes.positionConstraints.safeArea = .overridden
        ekAttributes.entranceAnimation = self.configs.entranceAnimation
        ekAttributes.exitAnimation = self.configs.exitAnimation
        SwiftEntryKit.display(entry: self.view!, using: ekAttributes)
    }
    
    open func hide() {
        SwiftEntryKit.dismiss()
        if let tg = alertTag {
            shownAlerts[tg] = false
        }
    }
    
    open func build() {
        
    }
    
    
    open func buildTitleLabel(label : UILabel) {
        label.text = self.title
        label.font = self.configs.titleFont
        label.textColor = self.configs.titleColor
        label.textAlignment = self.configs.titleAlign
    }
    
    open func buildMessageLabel(label : UILabel) {
        label.text = self.message
        label.font = self.configs.messageFont
        label.textColor = self.configs.messageColor
        label.textAlignment = self.configs.messageAlign
    }
    
    open func buildContainer(view : UIView) {
        view.layer.cornerRadius = self.configs.cornerRadius
        view.backgroundColor = self.configs.backgroundColor
    }

    
}

