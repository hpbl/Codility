/*
A non-empty zero-indexed array A consisting of N integers is given. Array A represents numbers on a tape.

Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].

The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|

In other words, it is the absolute difference between the sum of the first part and the sum of the second part.

For example, consider array A such that:

  A[0] = 3
  A[1] = 1
  A[2] = 2
  A[3] = 4
  A[4] = 3
We can split this tape in four places:

P = 1, difference = |3 − 10| = 7 
P = 2, difference = |4 − 9| = 5 
P = 3, difference = |6 − 7| = 1 
P = 4, difference = |10 − 3| = 7 
Write a function:

public func solution(_ A : inout [Int]) -> Int

that, given a non-empty zero-indexed array A of N integers, returns the minimal difference that can be achieved.

For example, given:

  A[0] = 3
  A[1] = 1
  A[2] = 2
  A[3] = 4
  A[4] = 3
the function should return 1, as explained above.

Assume that:

N is an integer within the range [2..100,000];
each element of array A is an integer within the range [−1,000..1,000].
Complexity:

expected worst-case time complexity is O(N);
expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.

Copyright 2009–2017 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
*/

//RESULT: 100% CORRECTNESS, 100% PERFORMANCE

import Foundation
import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int]) -> Int {
  var lhs = Array(repeating: 0, count: A.count - 1)
  var rhs = Array(repeating: 0, count: A.count - 1)
  var minDif = Int.max

  for index in 0..<lhs.count {
    if index > 0 {
      lhs[index] = A[index] + lhs[index - 1]
    } else {
      lhs[index] = A[index]
    }
    
    let complementIndex = lhs.count - index

    if complementIndex == lhs.count {
        rhs[complementIndex - 1] = A[complementIndex]
    } else {
        rhs[complementIndex - 1] = A[complementIndex] + rhs[complementIndex]
    }
  }

  for index in 0..<lhs.count {
    var currDif = abs(lhs[index] - rhs[index])
    if currDif < minDif {
        minDif = currDif
    }
  }

  return minDif
}
