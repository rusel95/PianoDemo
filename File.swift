import Foundation

class File {
    var path = String()
    let defaultData = ["Add project","Buy some milk","Wash a car"]

    init(_ fileName: String) {
        path = (NSTemporaryDirectory() + fileName) as String
        //path += fileName
    }

    func ifNotExist() {
        let fileManager = FileManager.default

        // Check if file exists, given its path

        if fileManager.fileExists(atPath: path) {
            print("File exists")
        } else {
            let data = ("Silentium est aureum" as NSString).data(using: String.Encoding.utf8.rawValue)

            if !fileManager.createFile(atPath: path, contents: data, attributes: nil){
                print("Impossible to create a file")
            }
        }
    }

    func getData () -> String {
        let file: FileHandle? = FileHandle(forReadingAtPath: path)
        var tempStr = String()
        if file != nil {
            // Read all the data
            let data = file?.readDataToEndOfFile()

            // Close the file
            file?.closeFile()

            // Convert our data to string
            tempStr = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
        }
        else {
            print("Ooops! Error while reading!")
        }

        return tempStr
    }

    func readRows () -> [String] {
        let temtStr = getData()
        let tempArray: [String] = temtStr.components(separatedBy: "\n")
        return tempArray
    }

    func writeRows(_ cells: [String]) {
        // Set the contents
        var contents = String()
        var cell = String()
        for i in 0..<cells.count {
            cell = cells[i]
            if i == cells.count - 1 {
                contents.append(cell)
            } else {
                contents.append(cell + "\n")
            }
        }
        do {
            // Write contents to file
            try contents.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print("Ooops! Error while sriting: \(error)")
        }
    }

    //MARK: Add a row to a file
    func addRow(_ buttonLabel: String, _ fullTime: String) {
        var contents = readRows()

        let rowText = buttonLabel + " " + fullTime

        contents.insert(rowText, at: 0)

        writeRows(contents)
    }
}
