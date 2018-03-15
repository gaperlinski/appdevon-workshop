//: Playground - noun: a place where people can play

import UIKit

var board = [[String]](repeating: [String](repeating: "", count: 10), count: 10)


board[5][3] = "x"


for (rowIndex, cols) in board.enumerated() {
    for (colIndex, col) in cols.enumerated() {
        if col == "x" {
            print("Found the treasure at \(rowIndex)x\(colIndex)")
            break // only exists inner scope
        }
    }
}

rowLoop: for (rowIndex, cols) in board.enumerated() { // you can apply labels to loops
    for (colIndex, col) in cols.enumerated() {
        if col == "x" {
            print("Found the treasure at \(rowIndex)x\(colIndex)")
            break rowLoop // exits top scope
        }
    }
}

someCondition: if 1 == 1 {} // you can apply labels to conditions too
