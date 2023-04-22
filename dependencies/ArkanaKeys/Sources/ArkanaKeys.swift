// DO NOT MODIFY
// Automatically generated by Arkana (https://github.com/rogerluan/arkana)

import Foundation
import ArkanaKeysInterfaces

public enum Keys {
    @inline(__always)
    fileprivate static let salt: [UInt8] = [
        0x97, 0xc8, 0xb6, 0x77, 0xf1, 0xe2, 0xa6, 0xd9, 0x44, 0xb8, 0x75, 0xb4, 0x1c, 0x57, 0xbb, 0x45, 0xf6, 0x6a, 0xff, 0x87, 0x1c, 0x1, 0x20, 0xc3, 0xcd, 0x4d, 0xf, 0x37, 0xb3, 0x29, 0xa6, 0xdd, 0x94, 0x23, 0xd0, 0x65, 0x96, 0x3, 0x66, 0x2d, 0x53, 0x4e, 0x17, 0xe2, 0x24, 0x7f, 0xd2, 0x34, 0x52, 0x86, 0xa4, 0xc6, 0x45, 0x2b, 0x38, 0x7a, 0x1c, 0x6d, 0xb5, 0xff, 0x2d, 0x5d, 0x81, 0x1f
    ]

    static func decode(encoded: [UInt8], cipher: [UInt8]) -> String {
        return String(decoding: encoded.enumerated().map { offset, element in
            element ^ cipher[offset % cipher.count]
        }, as: UTF8.self)
    }

    static func decode(encoded: [UInt8], cipher: [UInt8]) -> Bool {
        let stringValue: String = Self.decode(encoded: encoded, cipher: cipher)
        return Bool(stringValue)!
    }

    static func decode(encoded: [UInt8], cipher: [UInt8]) -> Int {
        let stringValue: String = Self.decode(encoded: encoded, cipher: cipher)
        return Int(stringValue)!
    }
}

public extension Keys {
    struct Global: KeysGlobalProtocol {
        public init() {}

        @inline(__always)
        public let aPI_KEY: String = {
            let encoded: [UInt8] = [
                0xf6, 0xaa, 0x86, 0x44, 0x95, 0xd5, 0xc7, 0xeb, 0x22, 0xd9, 0x44, 0x85, 0x2d, 0x67, 0xde, 0x26, 0x95, 0x59, 0xc9, 0xb7, 0x7d, 0x37, 0x19, 0xf0
            ]
            return Keys.decode(encoded: encoded, cipher: Keys.salt)
        }()
    }
}

public extension Keys {
    struct Debug: KeysEnvironmentProtocol {
        public init() {}
    }
}
public extension Keys {
    struct Release: KeysEnvironmentProtocol {
        public init() {}
    }
}