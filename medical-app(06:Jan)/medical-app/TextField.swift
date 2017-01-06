//
//  TextField.swift
//  medical-app
//
//  Created by Administrator on 28/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class dropTextField: UITextField{
//    class TextField: UILabel{

  override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
            if action == Selector("NSObject.paste(_:)") || action == Selector("NSObject.copy(_:)") || action == Selector("NSObject.select(_:)") || action == Selector("NSObject.selectAll(_:)"){
                return false
            }
            
            return super.canPerformAction(action, withSender: sender)
        }
}
