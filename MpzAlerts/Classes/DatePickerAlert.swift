//
//  DatePickerAlert.swift
//  MpzAlerts
//
//  Created by Hasitha Mapalagama on 11/6/19.
//

import Foundation

extension MpzAlerts {
    open class DatePickerAlert : MpzAlerts {
        
        @IBOutlet weak var container: UIView!
        @IBOutlet weak var buttonStack: UIStackView!
        @IBOutlet weak var datePicker: UIDatePicker!
        @IBOutlet weak var titleLabel: UILabel!
        
        public var minDate : Date?
        public var maxDate : Date?
        public var locale : Locale?
        public var value : Date?
        public var mode : UIDatePicker.Mode = .date
        
        public override init(frame: CGRect) {
            super.init(frame: frame)
            initializeView()
        }
        
        public required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initializeView()
        }
        
        override open func initializeView() {
            let nib = UINib(nibName: "DatePickerAlert", bundle: Bundle.init(for: type(of: self)))
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            self.view = view
        }
        
        override open func build() {
            buildContainer(view: self.container)
            buildTitleLabel(label: self.titleLabel)
            self.titleLabel.textAlignment = self.configs.datePickerAlertTitleAlign
            buttonStack.subviews.forEach({$0.removeFromSuperview()})
            for button in buttons {
                let b = button.getButton()
                buttonStack.addArrangedSubview(b)
            }
            setupDatePicler()
        }
        
        public func setMinDate(date : Date) -> DatePickerAlert {
            self.minDate = date
            return self
        }
        
        public func setMaxDate(date : Date) -> DatePickerAlert {
            self.maxDate = date
            return self
        }
        
        public func setValue(date : Date) -> DatePickerAlert {
            self.value = date
            return self
        }
        
        public func setLocale(locale : Locale) -> DatePickerAlert {
            self.locale = locale
            return self
        }
        
        public func setMode(mode : UIDatePicker.Mode) -> DatePickerAlert {
            self.mode = mode
            return self
        }
        
        private func setupDatePicler() {
            datePicker.minimumDate = self.minDate
            datePicker.maximumDate = self.maxDate
            datePicker.date = self.value ?? Date()
            datePicker.locale = self.locale
            datePicker.datePickerMode = self.mode
        }
        
        @IBAction func didValueChanged(_ sender: Any) {
            self.value = datePicker.date
        }
        
        
    }
}

