//
//  ViewController.swift
//  IOS_101_Prework
//
//  Created by Kelvin Ihezue on 12/2/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    func changeColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
    
    
    // VARIABLES
    
    var player: AVAudioPlayer!
    
    
    // TIMER
    var timer = Timer()
    var total_time = 4
    var seconds_passed = 0
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var School: UILabel!
    
    @IBOutlet weak var Aspirations: UILabel!
    
    @IBOutlet weak var progress_bar: UIProgressView!
    
    
    
    
    // / Added button to change the background color
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        
        // Reduce buttons Opaqueness by 50% when pressed for half a second
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.alpha = 1.0
        }
        
        let randomColor = changeColor()
        
        view.backgroundColor = randomColor
        
    }
    
    
    
    // Added button to change texts color
    
    @IBAction func changeTextColor(_ sender: UIButton) {
    
        
        timer.invalidate() // STOP THE ON GOING TIMER
        
        
        // RESET
        progress_bar.progress = 0.0
        
        seconds_passed = 0
        
        // Reduce buttons Opaqueness by 50% when pressed for half a second
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
            sender.alpha = 1.0
        }
        
        let randomColor = changeColor()
        
        
        
        name.textColor = randomColor
        School.textColor = randomColor
        Aspirations.textColor = randomColor
        
        //         TIMER HELPER FUNCTION
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update_timer), userInfo: nil, repeats: true)
        
    }
   
  
    @objc func update_timer() {
        
        timer.invalidate() // STOP THE ON GOING TIMER
        
        
        if seconds_passed == 0 {
            
            // INVALIDATE TIMER
            timer.invalidate() // STOP THE ON GOING TIMER
            
            // PLAY SOUND
            
            let url = Bundle.main.url(forResource: "alarm_sound" , withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            
            player.volume = 0.2
            player.play()
            
            seconds_passed += 1
            // visual
            progress_bar.progress = Float(seconds_passed) / Float(total_time)
            
        } else if (seconds_passed >= 1 && seconds_passed < total_time) {
            
            timer.invalidate() // STOP THE ON GOING TIMER
            
            seconds_passed += 1
            
            // visual
            progress_bar.progress = Float(seconds_passed) / Float(total_time)
            
            
        }
            
            
        
        
        
    }
    
    
    
    
}
