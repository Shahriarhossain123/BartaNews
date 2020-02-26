//
//  AppUtilities.swift
//  BartaNews
//
//  Created by apple on 2/26/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Foundation

class AppUtilities: NSObject {
    class func sizeOfString (string: String,
                             constrainedToWidth width: Double,
                             forFont font: UIFont) -> CGSize {
        return NSString(string: string).boundingRect(with: CGSize(width: width,
                                                                  height: Double.greatestFiniteMagnitude),
                                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                     attributes: [NSAttributedString.Key.font: font],
                                                     context: nil).size
    }
}
