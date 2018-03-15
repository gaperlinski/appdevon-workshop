//: Playground - noun: a place where people can play

import UIKit

assert(1 == 1, "Maths failure")

let pathToDebugFile = ""

func saveError(message: String, file: String = #file, line: Int = #line) -> String {
    _ = try? message.write(toFile: pathToDebugFile, atomically: true, encoding: .utf8)
    return message
}

assert(1 == 2, saveError(message: "Fatal error: maths be bad")) // don't fail at runtime
precondition(1 == 2, saveError(message: "Fatal error: maths be bad")) // fail at runtime

fatalError("This will always crash")

class MyCell: UITableViewCell {}

class ViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell else {
            fatalError("Failed to dequeue MyCell")
        }
        return cell
    }
}
