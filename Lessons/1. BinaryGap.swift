/*
Task description
A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps.

Write a function:

public func solution(_ N : Int) -> Int

that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5.

Assume that:

N is an integer within the range [1..2,147,483,647].
Complexity:

expected worst-case time complexity is O(log(N));
expected worst-case space complexity is O(1).
Copyright 2009–2017 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
*/

// RESULT: 80% CORRECTNESS

import Foundation
import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ N : Int) -> Int {
    // write your code in Swift 3.0 (Linux)    
    let binaryRep = toBinary(N)
    var binaryGap = 0
    
    let gaps = binaryRep.characters.split(separator: "1")

    let gapsCount = gaps.map({
        return $0.count
    })
    
    if gapsCount.max() != nil {
        binaryGap = gapsCount.max()!
    }

    return binaryGap
}

public func toBinary(_ number: Int) -> String {
    var binary = ""
    var divResult = number
    while (divResult != 0) {
        binary = binary + String(divResult % 2)
        divResult = divResult / 2
    }
    return binary
}
