//
//  AppDelegate.swift
//  SleepSoon
//
//  Created by Tim Kleinschmidt on 13.03.19.
//  Copyright © 2019 Tim Kleinschmidt. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    let halfHour = TimeInterval(1800)
    
    @IBAction func sleep(_ sender: NSButton) {
        sender.isEnabled = false
        Timer.scheduledTimer(timeInterval: halfHour, target: self, selector: #selector(fire), userInfo: nil, repeats: false)
        sender.isEnabled = true
    }
    
    @objc func fire() {
        let path = "/usr/bin/pmset"
        let arguments = ["sleepnow"]
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
    }

}

