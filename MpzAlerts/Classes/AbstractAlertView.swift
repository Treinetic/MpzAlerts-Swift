//
//  AlertView.swift
//  MD Gunasena
//
//  Created by Treinetic-Macbook on 1/28/19.
//  Copyright © 2019 Treinetic PVT LTD. All rights reserved.
//

import UIKit
//import SwiftEntryKit
//
//class MpzAlert : UIView {
//
//
//
//
//
//    func show() {
//
//        self.config.entranceAnimation =
//            .init(
//                translate: .none,
//                scale: .init(from: 0.5, to: 1, duration: 0.2),
//                fade: .init(from: 0, to: 1, duration: 0.1)
//                )
//
//        self.config.exitAnimation =
//            .init(
//                translate: .none,
//                scale: .init(from: 1, to: 0.5, duration: 0.2),
//                fade: .init(from: 1, to: 0, duration: 0.2)
//                )
//
//        self.config.positionConstraints =
//            .init(verticalOffset: 0,
//                  size: .init(width: .fill, height: .intrinsic),
//                  maxSize: .init(width: .constant(value: 400), height: .intrinsic)
//                 )
//
//        self.config.positionConstraints.safeArea = .overridden
//        self.config.positionConstraints.keyboardRelation = .bind(offset: .init(bottom: 20, screenEdgeResistance: 0))
//
//        if shownAlerts.contains(where: {k, v in return k == alertTag}) {
//            return
//        }
//        if let tg = alertTag {
//            shownAlerts[tg] = true
//        }
//        SwiftEntryKit.display(entry: view, using: config)
//
//    }
//
//    func hide() {
//        SwiftEntryKit.dismiss()
//        if let tg = alertTag {
//            shownAlerts[tg] = false
//        }
//    }
//}
