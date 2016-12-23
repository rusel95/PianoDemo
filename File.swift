import Foundation

class File {
    var path = String()
    let defaultData = ["Add project","Buy some milk","Wash a car"]

    init(_ fileName: String) {
        path = (NSTemporaryDirectory() + fileName) as String
    }

    //MARK: creating a new file if it is not exist
    func ifNotExist() {
        let fileManager = FileManager.default

        // Check if file exists, given its path

        if fileManager.fileExists(atPath: path) {
            print("File exists")
        } else {
            let data = ("Music log file was created a few seconds ago" as NSString).data(using: String.Encoding.utf8.rawValue)

            if !fileManager.createFile(atPath: path, contents: data, attributes: nil){
                print("Impossible to create a file")
            }
        }
    }

    //MARK: Get all data from file
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

    //MARK: read roews from file
    func readRows () -> [String] {
        let temtStr = getData()
        let tempArray: [String] = temtStr.components(separatedBy: "\n")
        return tempArray
    }

    //MARK: write rows to file
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
            print("Ooops! Error while writing: \(error)")
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
