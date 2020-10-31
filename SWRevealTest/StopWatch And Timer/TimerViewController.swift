//
//  ViewController.swift
//  TabBar
//
//  Created by tami on 9/29/20.
//
import UIKit


class TimerViewController: UIViewController {

    // Labels
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    //Buttons
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    //Variables
    var seconds: Int = 0
    var minutes: Int = 0
    var timer = Timer()
    
    // Slider
    
    @IBOutlet weak var slider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        seconds = 30
        slider.value = Float(seconds)
        
        if seconds == 60 {
            secondsLabel.text = "00"
            minutesLabel.text = "01"
        }else{
            minutesLabel.text = "00"
            if seconds < 10 {
                secondsLabel.text = "0\(String(seconds))"
            }else{
                secondsLabel.text = String(seconds)
            }
            
        }
        
        // Circular Buttons
        stopButton.layer.cornerRadius = stopButton.frame.width / 2
        stopButton.layer.masksToBounds = true
        stopButton.isEnabled = false
        
        pauseButton.layer.cornerRadius = stopButton.frame.width / 2
        pauseButton.layer.masksToBounds = true
        pauseButton.isEnabled = false
        
        playButton.layer.cornerRadius = stopButton.frame.width / 2
        playButton.layer.masksToBounds = true
        
        
    }
    @IBAction func sliderFunc(_ sender: UISlider) {
        
        
        sender.isContinuous = true
        seconds = Int(sender.value)
        if seconds == 60 {
            secondsLabel.text = "00"
            minutesLabel.text = "01"
        }else{
            minutesLabel.text = "00"
            if seconds < 10 {
                secondsLabel.text = "0\(String(seconds))"
            }else{
                secondsLabel.text = String(seconds)
            }
            
        }
        
        
    }
    
    

    @IBAction func playButtonAction(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
        slider.isHidden = true
        stopButton.isEnabled = true
        pauseButton.isEnabled = true
        playButton.isEnabled = false
        
    }
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        timer.invalidate()
        stopButton.isEnabled = true
        pauseButton.isEnabled = true
        playButton.isEnabled = true
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        seconds = 30
        slider.value = Float(seconds)
        secondsLabel.text = "\(seconds)"
        slider.isHidden = false
        resetTimer()
        stopButton.isEnabled = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
    }
    
    
    @objc fileprivate func count(){
        seconds -= 1
        
        if seconds < 1{
            timer.invalidate()
        } else if seconds > 1 && seconds < 10 {
            secondsLabel.text = "0\(seconds)"
        }else if seconds >= 10 && seconds < 60 {
            minutesLabel.text = "00"
            secondsLabel.text = "\(seconds)"
        }
        else {
            secondsLabel.text = "\(seconds)"
        }
    }
    
    func resetTimer(){
        seconds = 0
        timer.invalidate()
        secondsLabel.text = "00"
        minutesLabel.text = "00"
      
    }
}

