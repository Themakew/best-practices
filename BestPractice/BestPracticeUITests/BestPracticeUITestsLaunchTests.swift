//
//  BestPracticeUITestsLaunchTests.swift
//  BestPracticeUITests
//
//  Created by Ruyther Costa on 12/05/22.
//

import XCTest

class BestPracticeUITestsLaunchTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

}
