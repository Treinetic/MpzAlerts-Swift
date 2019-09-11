//
//  SnakBar.swift
//  MpzAlerts
//
//  Created by Hasitha Mapalagama on 9/11/19.
//

import Foundation
import SwiftEntryKit
extension MpzAlerts {
    
    open class Snackbar {
        

    
        public static func show(message: String, config: Configs = Configs.defaultConfigs) {
            var attributes = EKAttributes.bottomToast
            attributes.entryBackground = .color(color: EKColor.init(config.snackBarBackgroundColor))
            attributes.displayDuration = 3
            let title = EKProperty.LabelContent(text: message, style: .init(font: UIFont.systemFont(ofSize: 15), color: EKColor.init(config.snackBarTextColor)))
            let contentView = EKNoteMessageView(with: title)
            contentView.verticalOffset = 20
            SwiftEntryKit.display(entry: contentView, using: attributes)
        }
        
    }
    
}
