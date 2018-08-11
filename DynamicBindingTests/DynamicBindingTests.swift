//
//  DynamicBindingTests.swift
//  DynamicBindingTests
//
//  Created by ZHITAO TIAN on 2018-08-11.
//  Copyright © 2018 ZHITAO TIAN. All rights reserved.
//

import XCTest
@testable import DynamicBinding

class DynamicTests: XCTestCase {
    
    let initialText = "initial text"
    let modifiedText = "yo whatsup"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_bind() {
        let mockLabel = UILabel()
        var dynamicText = DynamicString<UILabel>(value: initialText)
        dynamicText.bindText(to: mockLabel)
        
        XCTAssertEqual(mockLabel.text, initialText)
    }
    
    func test_modifyValue() {
        let mockLabel = UILabel()
        var dynamicText = DynamicString<UILabel>(value: initialText)
        dynamicText.bindText(to: mockLabel)
        
        dynamicText.setTextValue(modifiedText)
        
        XCTAssertEqual(mockLabel.text, modifiedText)
    }
    
    func test_modifyUI() {
        let mockLabel = UILabel()
        var dynamicText = DynamicString<UILabel>(value: initialText)
        dynamicText.bindText(to: mockLabel)
        
        mockLabel.text = modifiedText
        
        XCTAssertEqual(dynamicText.getTextValue(), modifiedText)
    }
    
}
