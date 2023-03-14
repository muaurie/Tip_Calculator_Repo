//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //mark - properties
    var isDefaultStatusBar = true
    //keeps track of whcih status bar style -preferredStatusBarStyle- should display.
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDefaultStatusBar ? .default : .lightContent 
    }
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    @IBOutlet weak var inputCardView: UIView!
    @IBOutlet weak var outputCardView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
    @IBOutlet weak var resetButton: UIButton!
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        setTheme(isDark: false)
        //this way the superview will load in our initial theme.
        
        billAmountTextField.calculateButtonAction = {
            self.calculate()
    
        }
    }
    
    func calculate() {
        // dismiss keyboard
        if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
        }
        
        guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                clear()
                return
        }
        
        let roundedBillAmount = (100 * billAmount).rounded() / 100
        
        let tipPercent: Double
        switch tipPercentSegmentedControl.selectedSegmentIndex {
        case 0:
            tipPercent = 0.15
        case 1:
            tipPercent = 0.18
        case 2:
            tipPercent = 0.20
        default:
            preconditionFailure("Unexpected index.")
        
        }
        
        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = (100 * tipAmount).rounded() / 100
        
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        //update UI
        self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
        self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
        
    }
    
    func clear() {
        billAmountTextField.text = nil
        tipPercentSegmentedControl.selectedSegmentIndex = 0
        tipAmountLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
    }
    
    func setupViews() {
        // this method initally configures ea. views respective layer
        //*add code for shadow to header view
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 0.05
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        
        //*add rounded corners to the input card:
        inputCardView.layer.cornerRadius = 8
        inputCardView.layer.masksToBounds = true
        //'true' prevents our view's content from appearing outside of our rounded corner's boundary
        outputCardView.layer.cornerRadius = 8
        outputCardView.layer.masksToBounds = true
        //add output card border
        outputCardView.layer.borderWidth = 1
        outputCardView.layer.borderColor = UIColor.tcHotPink.cgColor
        
        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
    }
    
    //UISwitch to change from dark to light theme
    func setTheme(isDark: Bool) {
        let theme = isDark ? ColorTheme.dark : ColorTheme.light

           view.backgroundColor = theme.viewControllerBackgroundColor

           headerView.backgroundColor = theme.primaryColor
           titleLabel.textColor = theme.primaryTextColor

           inputCardView.backgroundColor = theme.secondaryColor

           billAmountTextField.tintColor = theme.accentColor
           tipPercentSegmentedControl.tintColor = theme.accentColor

           outputCardView.backgroundColor = theme.primaryColor
           outputCardView.layer.borderColor = theme.accentColor.cgColor

           tipAmountTitleLabel.textColor = theme.primaryTextColor
           totalAmountTitleLabel.textColor = theme.primaryTextColor

           tipAmountLabel.textColor = theme.outputTextColor
           totalAmountLabel.textColor = theme.outputTextColor

           resetButton.backgroundColor = theme.secondaryColor
        
        //To make sure our status bar is updated when our theme is toggled
        isDefaultStatusBar = theme.isDefaultStatusBar
        setNeedsStatusBarAppearanceUpdate()
    }
    
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
    }
    @IBAction func themeToggled(_ sender: UISwitch) {
          if sender.isOn {
              setTheme(isDark: sender.isOn)
              //The theme will be set corresponding to the switch's isOn property.
          } else {
              setTheme(isDark: false)
          }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        clear()
        print("reset button tapped")
    }
    
    
}

