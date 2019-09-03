//
//  ViewController.swift
//  MpzAlerts
//
//  Created by mapalagama93 on 09/03/2019.
//  Copyright (c) 2019 mapalagama93. All rights reserved.
//

import UIKit
import MpzAlerts
class ViewController: UIViewController {
    @IBOutlet weak var seg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MpzAlerts.Configs.defaultConfigs.tapToHide = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func std(_ sender: Any) {
        MpzAlerts.Configs.defaultConfigs.position = getPosition()
        MpzAlerts.STDAlert()
        .setTitle("Title")
        .setMessage("Dispose of any resources that can be recreated")
            .addButton("OK", handler: {})
        .show()
    }
    @IBAction func actionAlert(_ sender: Any) {
      
        let al = MpzAlerts.ActionAlert()
        .setTitle("title")
        .setMessage("Dispose of any resources that can be recreated")
        .addButton("print", handler: {})
        .addButton("No print", handler: {})
        .addButton("No image", image: nil, handler: {})
        al.configs.tapToHide = true
        al.show()
        
    }
    @IBAction func imageAlert(_ sender: Any) {
        MpzAlerts.Configs.defaultConfigs.position = getPosition()
        MpzAlerts.ImageAlert()
        .setTitle("title")
        .setMessage("Dispose of any resources that can be recreated")
            .setImage(UIImage.init(named: "sale")!)
        .addButton("print", handler: {})
        .show()
        
    }
    
    func getPosition() -> MpzAlerts.Position{
        switch seg.selectedSegmentIndex {
        case 0:
            return .top
        case 1:
            return .center
        case 2:
            return .bottom
        default:
            return .center
        }
    }
}

