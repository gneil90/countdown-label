//
//  ViewController.swift
//  countdown
//
//  Created by Yan Saraev on 7/26/15.
//  Copyright (c) 2015 nt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var timerLabel: UILabel?
	var timer = NSTimer();
	var startDate:NSDate?;
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func startTimer(sender: UIButton) {
		sender.selected = !sender.selected;
		//if selected fire timer, otherwise stop
		if (sender.selected) {
			self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true);
			self.startDate = NSDate();
		} else {
			self.stopTimer();
		}

	}
	
	func stopTimer() {
		self.timer.invalidate();
	}

	func updateTimer() {
		// Create date from the elapsed time
		var currentDate:NSDate = NSDate();
		var timeInterval:NSTimeInterval = currentDate.timeIntervalSinceDate(self.startDate!);
		
		//300 seconds count down
		var timeIntervalCountDown = 300 - timeInterval;
		var timerDate:NSDate = NSDate(timeIntervalSince1970: timeIntervalCountDown);
		
		// Create a date formatter
		var dateFormatter = NSDateFormatter();
		dateFormatter.dateFormat = "mm:ss";
		dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0);
		
		// Format the elapsed time and set it to the label
		var timeString = dateFormatter.stringFromDate(timerDate);
		self.timerLabel?.text = timeString;
	}
}

