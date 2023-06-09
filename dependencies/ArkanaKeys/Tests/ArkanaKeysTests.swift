// DO NOT MODIFY
// Automatically generated by Arkana (https://github.com/rogerluan/arkana)

import Foundation
import ArkanaKeysInterfaces
import XCTest
@testable import ArkanaKeys

final class KeysTests: XCTestCase {
    private var salt: [UInt8]!
    private var globalSecrets: KeysGlobalProtocol!

    override func setUp() {
        super.setUp()
        salt = [
            0x97, 0xc8, 0xb6, 0x77, 0xf1, 0xe2, 0xa6, 0xd9, 0x44, 0xb8, 0x75, 0xb4, 0x1c, 0x57, 0xbb, 0x45, 0xf6, 0x6a, 0xff, 0x87, 0x1c, 0x1, 0x20, 0xc3, 0xcd, 0x4d, 0xf, 0x37, 0xb3, 0x29, 0xa6, 0xdd, 0x94, 0x23, 0xd0, 0x65, 0x96, 0x3, 0x66, 0x2d, 0x53, 0x4e, 0x17, 0xe2, 0x24, 0x7f, 0xd2, 0x34, 0x52, 0x86, 0xa4, 0xc6, 0x45, 0x2b, 0x38, 0x7a, 0x1c, 0x6d, 0xb5, 0xff, 0x2d, 0x5d, 0x81, 0x1f
        ]
        globalSecrets = Keys.Global()
    }

    override func tearDown() {
        globalSecrets = nil
        salt = nil
        super.tearDown()
    }

    func test_decodeRandomHexKey_shouldDecode() {
        let encoded: [UInt8] = [
            0xf6, 0xfe, 0xd7, 0x4f, 0x93, 0xd1, 0x9f, 0xeb, 0x72, 0xdd, 0x46, 0x86, 0x78, 0x6e, 0xd9, 0x77, 0x93, 0x8, 0x9a, 0xb1, 0x29, 0x31, 0x13, 0xa1, 0xff, 0x78, 0x6d, 0x53, 0x87, 0x4f, 0x91, 0xbc, 0xf6, 0x45, 0xe1, 0x1, 0xf7, 0x3a, 0x7, 0x4f, 0x62, 0x7b, 0x2e, 0xd0, 0x14, 0x1a, 0xe6, 0x3, 0x6b, 0xb6, 0x94, 0xf0, 0x20, 0x48, 0xb, 0x49, 0x79, 0xe, 0x8c, 0xca, 0x49, 0x6d, 0xb6, 0x7d, 0xa3, 0xfa, 0x80, 0x12, 0xc0, 0xd1, 0x97, 0xbf, 0x25, 0x81, 0x41, 0x87, 0x78, 0x62, 0x8d, 0x77, 0xc6, 0xb, 0x9b, 0xe5, 0x2b, 0x31, 0x14, 0xa0, 0xaf, 0x7c, 0x3d, 0x2, 0xd1, 0x4a, 0xc3, 0xec, 0xa3, 0x11, 0xe0, 0x7, 0xf0, 0x3b, 0x5, 0x1b, 0x66, 0x78, 0x73, 0xd6, 0x16, 0x19, 0xb3, 0x57, 0x30, 0xe4, 0x93, 0xa3, 0x7c, 0x1a, 0x5a, 0x4a, 0x2e, 0xb, 0xd6, 0x9b, 0x14, 0x39, 0xe7, 0x2b
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), "a6a8b3926e32d9b2ebe6503b25bd4f7abf1da9ab15920e479006ec33ec95d07b426e131fa943d5620adb704cb125bce1720bf8c656d42facbb7e91b02fcd9df4")
    }

    func test_decodeRandomBase64Key_shouldDecode() {
        let encoded: [UInt8] = [
            0xf3, 0x81, 0xdd, 0x34, 0x9e, 0xa8, 0x8d, 0x8d, 0x71, 0xfd, 0x3e, 0xfc, 0x46, 0x30, 0xd6, 0x3, 0x99, 0x22, 0x9c, 0xd5, 0x4b, 0x66, 0x12, 0xf3, 0xfe, 0x7c, 0x3b, 0x61, 0xc2, 0x5d, 0xdf, 0x93, 0xe1, 0x79, 0x9f, 0x4e, 0xdf, 0x42, 0x2f, 0x4b, 0x3a, 0x1a, 0x22, 0x98, 0x42, 0x2b, 0xe6, 0x72, 0x1, 0xf2, 0x91, 0x8c, 0, 0x47, 0x6b, 0x4c, 0x2d, 0x3, 0xd7, 0xac, 0x18, 0x6f, 0xe9, 0x6b, 0xa5, 0xa0, 0xdf, 0x45, 0x87, 0x98, 0xf3, 0x94, 0x5, 0xda, 0x2d, 0x80, 0x4e, 0x25, 0xf9, 0x71, 0xa0, 0x3, 0x96, 0xea, 0x75, 0x40, 0x1d, 0xfe
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), "dIkCoJ+T5EKHZgmFoHcRWg20314VqtyNuZO+IAIfiT5zfT4FSt5JElS61nbS52ht2hi2vzUMAbX4RrB4ViimiA==")
    }

    func test_decodeUUIDKey_shouldDecode() {
        let encoded: [UInt8] = [
            0xa2, 0xf0, 0x81, 0x46, 0x90, 0x84, 0xc7, 0xba, 0x69, 0x88, 0x4d, 0xd2, 0x79, 0x7a, 0x8f, 0x21, 0x90, 0xf, 0xd2, 0xe5, 0x29, 0x34, 0x17, 0xee, 0xab, 0x7a, 0x3d, 0xe, 0xd5, 0x11, 0xc4, 0xbf, 0xa1, 0x10, 0xe7, 0x4
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), "5871afac-08fe-4dfe-b557-f729f8bb537a")
    }

    func test_decodeTrueBoolValue_shouldDecode() {
        let encoded: [UInt8] = [
            0xe3, 0xba, 0xc3, 0x12
        ]
        XCTAssertTrue(Keys.decode(encoded: encoded, cipher: salt))
    }

    func test_decodeFalseBoolValue_shouldDecode() {
        let encoded: [UInt8] = [
            0xf1, 0xa9, 0xda, 0x4, 0x94
        ]
        XCTAssertFalse(Keys.decode(encoded: encoded, cipher: salt))
    }

    func test_decodeIntValue_shouldDecode() {
        let encoded: [UInt8] = [
            0xa3, 0xfa
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), 42)
    }

    func test_encodeAndDecodeValueWithDollarSign_shouldDecode() {
        let encoded: [UInt8] = [
            0xe5, 0xad, 0xd7, 0x1b, 0xae, 0xc6, 0xca, 0xb0, 0x29, 0xe7, 0x6, 0xdc, 0x7d, 0x33, 0xc2
        ]
        XCTAssertEqual(Keys.decode(encoded: encoded, cipher: salt), "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andEscaped_andNoQuotes_shouldDecode() {
        XCTAssertEqual(globalSecrets.secretWithDollarSignEscapedAndAndNoQuotesKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andEscaped_andDoubleQuotes_shouldDecode() {
        XCTAssertEqual(globalSecrets.secretWithDollarSignEscapedAndDoubleQuoteKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andNotEscaped_andSingleQuotes_shouldDecode() {
        XCTAssertEqual(globalSecrets.secretWithDollarSignNotEscapedAndSingleQuoteKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andNotEscaped_andDoubleQuotes_shouldDecodeWithUnexpectedValue() {
        XCTAssertNotEqual(globalSecrets.secretWithDollarSignNotEscapedAndDoubleQuotesKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withDollarSign__andNotEscaped_andNoQuotes_shouldDecodeWithUnexpectedValue() {
        XCTAssertNotEqual(globalSecrets.secretWithDollarSignNotEscapedAndNoQuotesKey, "real_$lim_shady")
    }

    func test_decodeEnvVarFromDotfile_withWeirdCharacters_shouldDecode() {
        XCTAssertEqual(globalSecrets.secretWithWeirdCharactersKey, "` ~ ! @ # % ^ & * ( ) _ - + = { [ } } | : ; ' < , > . ? /")
    }
}
