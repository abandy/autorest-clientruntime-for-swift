/**
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See License.txt in the project root for
 * license information.
 */

import Foundation

public struct AuthFile {
   
    static func parseJsonFile(path: String) throws -> AuthFileData {
        let decoder = JSONDecoder()
        let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        guard let jsonData = content.data(using: .utf8, allowLossyConversion: false) else {
            throw AuthFileError.stringData
        }
        
        let authFileData = try decoder.decode(AuthFileData.self, from: jsonData)
        return authFileData
    }
}

public class AuthFileData : Codable {
    let baseURL: String
    let client: String
    let managementURI: String
    let key: String
    let tenant: String
    let authURL: String
    let subscription: String
}

enum AuthFileError : Error {
    case stringData
}


