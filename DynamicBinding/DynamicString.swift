//
//  DynamicString.swift
//  DynamicBinding
//
//  Created by ZHITAO TIAN on 2018-08-11.
//  Copyright © 2018 ZHITAO TIAN. All rights reserved.
//

import UIKit

protocol TextBindable: class {
    func update(value: String)
    func observing() -> String
}

struct DynamicString<T: TextBindable> {
    
    typealias Listener = (String) -> Void
    var listener: Listener?
    
    fileprivate var value: String { didSet { update() } }
    
    fileprivate weak var target: T?
    
    init(value: String) {
        self.value = value
    }
    
    func getTextValue() -> String {
        return target?.observing() ?? ""
    }
    
    mutating func setTextValue(_ value: String) {
        self.value = value
    }
    
    mutating func bindText(to: T, with listener: Listener? = nil) {
        target = to
        self.listener = listener
        target?.update(value: value)
    }
    
    fileprivate func update() {
        listener?(value)
        target?.update(value: value)
    }
}

extension UILabel: TextBindable {
    func update(value: String) {
        text = value
    }
    
    func observing() -> String {
        return text ?? ""
    }
}

extension UITextField: TextBindable {
    func update(value: String) {
        text = value
    }
    
    func observing() -> String {
        return text ?? ""
    }
}
