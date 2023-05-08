// Importing
import Foundation

final class Alphabet {

    // Alphabet wrap function
    static func alphabetWrap(currentChar: Character, count: Int) -> [Character] {

        // If count is less than zero return empty array
        guard count > 0 else {
            return []
        }

        // Add the current character to the list
        var wrappedChars: [Character] = []
        wrappedChars.append(currentChar)

        // Set next char to the next character.
        var nextChar = currentChar.asciiValue! + 1

        // If next char is 'z' wrap back to 'z'
        if nextChar > Character("z").asciiValue! {
            nextChar = Character("a").asciiValue!
        }

        // Recursively call the func for the next character.
        wrappedChars += alphabetWrap(currentChar: Character(UnicodeScalar(nextChar)), count: count - 1)

        // Return the wrapped characters
        return wrappedChars
    }

    //This is the main function.
    static func main() {
        do {
            // Create the input file then read it.
            let inputFile = URL(fileURLWithPath: "input.txt")
            let inputText = try String(contentsOf: inputFile)

            let lines = inputText.split(separator: "\n")

            // Create the output file.
            let outputFile = URL(fileURLWithPath: "output.txt")
            var outputText = ""

            // Go through each line and get the char and count.
            for line in lines {
                // Separate by spaces.
                let parts = line.split(separator: " ")
                if parts.count == 2 {

                    // Take the first char from the parts.
                    let currentChar = parts[0].first!

                    // Parse the integer value
                    if let count = Int(parts[1]) {

                        // Function call and set it to result.
                        let result = alphabetWrap(currentChar: currentChar, count: count)
                        outputText += result.description + "\n"

                    } else {
                        // Display error message
                        outputText += "Invalid input.\n"
                    }
                } else {
                    // Display error message in else statement.
                    outputText += "Invalid input!\n"
                }
            }

            // Write the output to the output file
            try outputText.write(to: outputFile, atomically: true, encoding: .utf8)

            // Print to show the output was sent (for test).
            print("Output sent.")
        } catch {

            // Display error message.
            print("Error: \(error.localizedDescription)")
        }
    }
}

// Call the main function to start program
Alphabet.main()
