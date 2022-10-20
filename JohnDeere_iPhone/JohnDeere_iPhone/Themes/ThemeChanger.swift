//
//  ThemeChanger.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import UIKit

protocol Theme {
    var themeName: String { get }
    var fontColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var boxesColor: UIColor { get }
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var tertiaryColor: UIColor { get }
    var quaternaryColor: UIColor { get }
    var quinaryColor: UIColor { get }
    var senaryColor: UIColor { get }
}
