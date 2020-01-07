//
//  NotificationCenter+Extension.swift
//  Network
//
//  Created by David on 2020/1/6.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation


extension NotificationCenter {
    // Avoid adding multipule Notification observer
    func setObserver(_ observer: AnyObject, selector: Selector, name: NSNotification.Name, object: AnyObject?) {
        NotificationCenter.default.removeObserver(observer, name: name, object: object)
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
}
