//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Vignesh Nayak P on 8/12/20.
//  Copyright © 2020 Vignesh Nayak P. All rights reserved.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Request permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound]) { (granted, error) in
            
        }
        
        //Content
        let content = UNMutableNotificationContent()
        content.title = "Hey there!"
        content.body = "This is the Notification body"
        
        //Trigger
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //Request
        let id = UUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        //Register
        center.add(request) { (error) in
            //error handling
        }
        
        
    }


}

