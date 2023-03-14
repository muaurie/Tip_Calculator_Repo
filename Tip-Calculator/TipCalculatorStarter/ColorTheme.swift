//
//  ColorTheme.swift
//  TipCalculatorStarter
//
//  Created by Cherish Spikes on 3/13/23.
//  Copyright © 2023 Make School. All rights reserved.
//

import UIKit

struct ColorTheme {
    //mark - class vars
    static let light = ColorTheme(isDefaultStatusBar: true,
                                    viewControllerBackgroundColor: .tcOffWhite,
                                    primaryColor: .tcWhite,
                                    primaryTextColor: .tcCharcoal,
                                    secondaryColor: .tcDarkBlue,
                                    accentColor: .tcHotPink,
                                    outputTextColor: .tcAlmostBlack)

    static let dark = ColorTheme(isDefaultStatusBar: false,
                                   viewControllerBackgroundColor: .tcAlmostBlack,
                                   primaryColor: .tcMediumBlack,
                                   primaryTextColor: .tcWhite,
                                   secondaryColor: .tcBlueBlack,
                                   accentColor: .tcSeafoamGreen,
                                   outputTextColor: .tcWhite)
    //mark - instance vars
    
    let isDefaultStatusBar: Bool
    let viewControllerBackgroundColor: UIColor
    
    let primaryColor: UIColor
    let primaryTextColor: UIColor
    
    let secondaryColor: UIColor
    
    let accentColor: UIColor
    let outputTextColor: UIColor
}
