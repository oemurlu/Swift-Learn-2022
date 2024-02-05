//
//  LicenseValidator.swift
//  testingExampleTests
//
//  Created by Osman Emre Ömürlü on 5.02.2024.
//

import XCTest
@testable import testingExample

final class LicenseValidatorTest: XCTestCase {

    func testThrowingEmptyLicenseKeyError() {
        let validator = LicenseValidator()
        
        XCTAssertThrowsError(try validator.validate(licenseKey: ""), "An empty license key error should be thrown") { error in
            // We ensure the expected error is thrown.
            XCTAssertEqual(error as? LicenseValidator.Error, .emptyLicenseKey)
        }
    }
    
    func testNotThrowingLicenseErrorForNonEmptyKey() {
        let validator = LicenseValidator()
        
        XCTAssertNoThrow(try validator.validate(licenseKey: "XXXX-XXXX"), "Non-empty license key should pass")
    }
    

}
