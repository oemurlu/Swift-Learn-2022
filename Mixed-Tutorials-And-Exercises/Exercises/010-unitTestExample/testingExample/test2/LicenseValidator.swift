//
//  LicenceValidator.swift
//  testingExample
//
//  Created by Osman Emre Ömürlü on 5.02.2024.
//

import Foundation

struct LicenseValidator {
    enum Error: Swift.Error {
        case emptyLicenseKey
    }
    
    func validate(licenseKey: String) throws {
        guard !licenseKey.isEmpty else {
            throw Error.emptyLicenseKey
        }
    }
}

