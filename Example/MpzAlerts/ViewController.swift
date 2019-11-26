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
        .addButton("Dispose of any resources that can be  Dispose of any resources that can be ", handler: {})
        .addButton("Dispose of any resources that can be ", handler: {})
        .addButton("No image Dispose of any resources that can be Dispose of any resources that can be ", image: nil, handler: {})
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
    @IBAction func didClickCustom(_ sender: Any) {
        TestAlertView().show()
    }
    
    @IBAction func dateAlert(_ sender: Any) {
         MpzAlerts.Configs.defaultConfigs.position = getPosition()
        MpzAlerts.DatePickerAlert()
        .setTitle("Pick a Date")
        .addButton("Done", handler: {})
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
    @IBAction func snackbar(_ sender: Any) {
        MpzAlerts.Snackbar.show(message: "this is snack bar")
    }
    
    
}

import Foundation
import UIKit
class TestAlertView : MpzAlerts {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
    }
    
    override func initializeView() {
        print("view build")
        let nib = UINib(nibName: "TestAlertView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view = view
    }
}

