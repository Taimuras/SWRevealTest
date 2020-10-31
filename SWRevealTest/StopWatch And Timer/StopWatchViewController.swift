import UIKit

class StopWatchViewController: UIViewController {
    // Buttons Outlets
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    // Lables Outlets
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    // Variables
    var hours = 0
    var minutes = 0
    var seconds = 0
    //Timer init
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
        stopButton.layer.cornerRadius = stopButton.frame.width / 2
        stopButton.layer.masksToBounds = true
        stopButton.isEnabled = false
        
        pauseButton.layer.cornerRadius = stopButton.frame.width / 2
        pauseButton.layer.masksToBounds = true
        pauseButton.isEnabled = false
        
        playButton.layer.cornerRadius = stopButton.frame.width / 2
        playButton.layer.masksToBounds = true
    }
    
   
    @IBAction func start(_ sender: UIButton) {
        // Starting the Timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
        stopButton.isEnabled = true
        pauseButton.isEnabled = true
        playButton.isEnabled = false
        
        
    }
    
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
        stopButton.isEnabled = true
        pauseButton.isEnabled = true
        playButton.isEnabled = true
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        resetTimer()
        stopButton.isEnabled = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
    }
    
    
    
    @objc fileprivate func count(){
        seconds += 1
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        if minutes == 60 {
            minutes = 0
            seconds = 0
            hours += 1
        }
        if hours == 24 {
            resetTimer()
        }
        if seconds < 10 {
            secondLabel.text = "0\(seconds)"
        }else{
            secondLabel.text = "\(seconds)"
        }
        if minutes < 10 {
            minuteLabel.text = "0\(minutes)"
        }else{
            minuteLabel.text = "\(minutes)"
        }
        
        if hours < 10 {
            hourLabel.text = "0\(hours)"
        }else{
            hourLabel.text = "\(hours)"
        }
    }
    
    func resetTimer(){
        seconds = 0
        minutes = 0
        hours = 0
        timer.invalidate()
        secondLabel.text = "00"
        minuteLabel.text = "00"
        hourLabel.text = "00"
        
    }
    
}
