//
//  ViewController.swift
//  dataStorageLog
//
//  Created by Admin on 16.12.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var MyFile = File("test.txt")
    var MyAudios = Audios()
    var MyTime = Time()

    @IBOutlet var pianoButtons: [UIButton]!
    @IBOutlet weak var logTextView: UITextView!

    @IBAction func actionButton(_ sender: UIButton) {

        let buttonlabel = (sender.titleLabel?.text)!

        //Playing a sound
        MyAudios.playback(buttonlabel)

        //Add new row to log
        MyFile.addRow(buttonlabel, MyTime.getFullTime())

        //View to the screen
        logTextView.text = MyFile.getData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //Create a LogFile if it`s not exist
        MyFile.ifNotExist()

        //Display log to logView
        logTextView.text = MyFile.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

