// Copyright (c) 2015-2016 David Turnbull
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and/or associated documentation files (the
// "Materials"), to deal in the Materials without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Materials, and to
// permit persons to whom the Materials are furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Materials.
//
// THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.

import XCTest
import SGLMath

class Vector4Tests: XCTestCase {

    func testInit() {
        let v1 = vec4(1, 2, 3, 4)
        let v2 = vec4(vec2(1, 2), 3, 4)
        let v3 = vec4(1, vec2(2, 3), 4)
        let v4 = vec4(1, 2, vec2(3, 4))
        let v5 = vec4(vec2(1, 2), vec2(3, 4))

        XCTAssertEqual(v1, v2)
        XCTAssertEqual(v1, v3)
        XCTAssertEqual(v1, v4)
        XCTAssertEqual(v1, v5)
    }

    func testAddFloat() {
        let v1 = vec4(1, 2, 3, 4)
        let v2 = vec4(10, 20, 30, 40)
        let v3 = vec4(11, 22, 33, 44)
        XCTAssertEqual(v1+v2, v3)
    }

    func testAddInt() {
        let v1 = ivec4(1, 2, 3, 4)
        let v2 = ivec4(10, 20, 30, 40)
        let v3 = ivec4(11, 22, 33, 44)
        XCTAssertEqual(v1&+v2, v3)
    }

    func testSubFloat() {
        let v1 = vec4(1, 2, 3, 4)
        let v2 = vec4(10, 20, 30, 40)
        let v3 = vec4(-9, -18, -27, -36)
        XCTAssertEqual(v1-v2, v3)
    }

    func testSubInt() {
        let v1 = ivec4(1, 2, 3, 4)
        let v2 = ivec4(10, 20, 30, 40)
        let v3 = ivec4(-9, -18, -27, -36)
        XCTAssertEqual(v1&-v2, v3)
    }

    func testMulFloat() {
        let v1 = vec4(2, 3, 4, 5)
        let v2 = vec4(10, 20, 30, 40)
        let v3 = vec4(20, 60, 120, 200)
        XCTAssertEqual(v1*v2, v3)
        let v4 = vec4(4, 6, 8, 10)
        XCTAssertEqual(v1*2, v4)
    }

    func testMulInt() {
        let v1 = ivec4(2, 3, 4, 5)
        let v2 = ivec4(10, 20, 30, 40)

        let v3 = ivec4(20, 60, 120, 200)
        XCTAssertEqual(v1&*v2, v3)

        let v4 = ivec4(6, 9, 12, 15)
        XCTAssertEqual(3 &* v1, v4)
    }

    func testMulUInt() {
        let v1 = uvec4(2, 3, 4, 5)
        let v2 = uvec4(10, 20, 30, 40)

        let v3 = uvec4(20, 60, 120, 200)
        XCTAssertEqual(v1&*v2, v3)

        let v4 = uvec4(6, 9, 12, 15)
        XCTAssertEqual(3 &* v1, v4)
    }

    func testDivFloat() {
        let v1 = vec4(20, 60, 120, 200)
        let v2 = vec4(2, 3, 4, 5)
        let v3 = vec4(10, 20, 30, 40)
        XCTAssertEqual(v1/v2, v3)
    }

    func testDivInt() {
        let v1 = ivec4(20, 60, 120, 200)
        let v2 = ivec4(2, 3, 4, 5)
        let v3 = ivec4(10, 20, 30, 40)
        XCTAssertEqual(v1/v2, v3)
    }

    func testPointers() {
        var v0 = vec4(0, 1, 2, 3)
        let v1 = vec4(20, 21, 22, 23)

        v0.withUnsafePointer { pointer in
            for i in 0..<4 {
                XCTAssertEqual(pointer[i], Float(i))
            }
        }

        v0.withUnsafeMutablePointer { pointer in
            for i in 0..<4 {
                pointer[i] += 20
            }
        }

        v0.withUnsafeBufferPointer { buffer in
            for (i, element) in buffer.enumerated() {
                XCTAssertEqual(element, Float(i + 20))
            }
        }

        XCTAssertEqual(v0, v1)
    }

    static var allTests = [
        ("testInit", testInit),
        ("testAddFloat", testAddFloat),
        ("testAddInt", testAddInt),
        ("testSubFloat", testSubFloat),
        ("testSubInt", testSubInt),
        ("testMulFloat", testMulFloat),
        ("testMulInt", testMulInt),
        ("testMulUInt", testMulUInt),
        ("testDivFloat", testDivFloat),
        ("testDivInt", testDivInt),
        ("testPointers", testPointers)
    ]
}
