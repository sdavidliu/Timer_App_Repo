import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var setting: UIButton!
    @IBOutlet weak var startPause: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    var timer = NSTimer()
    var started = false;
    var pause = false;
    var done = false;
    //var startTime = 10
    var sec = 0
    
    //var debates = ["debate1", "debate2", "debate3", "debate4", "debate5"]
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    let imageView = UIImageView(image: UIImage(named: "five.png")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
        imageView.frame = CGRect(x: screenSize.width/2-imageView.frame.width/5/2, y: screenSize.height/2-imageView.frame.height/5*0.3, width: imageView.frame.width/5, height: imageView.frame.height/5)
        //view.addSubview(imageView)
        setting.setImage(UIImage(named: "settings.png"), forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func start() {
        
        //timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countDown", userInfo: nil, repeats: true)
        if (started == false){
            //sec = startTime
            timer = NSTimer(timeInterval: 1.0, target: self, selector: "countDown", userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
            started = true
            done = false
            startPause.setTitle("Pause", forState: UIControlState.Normal)
        }else if (pause == false){
            startPause.setTitle("Start", forState: UIControlState.Normal)
            pause = true
        }else if (pause){
            startPause.setTitle("Pause", forState: UIControlState.Normal)
            pause = false
        }
    }
    
    func countDown() {
        if (started == true && pause == false && done == false){
            sec += 1
        }
        updateText()
    }
    
    @IBAction func reset() {
        timer.invalidate()
        startPause.setTitle("Start", forState: UIControlState.Normal)
        started = false
        pause = false
        //sec = startTime
        sec = 0
        updateText()
    }
    
    func updateText() {
        let disMin = Int(sec / 60)
        let disSec = sec - disMin * 60
        var minText = String("\(disMin)")
        var secText = String("\(disSec)")
        for _ in 0..<2 - minText.characters.count {
            minText = "0" + minText;
        }
        for _ in 0..<2 - secText.characters.count {
            secText = "0" + secText;
        }
        
        
        timeLabel.text = "\(minText) min  \(secText) sec"
    }

    @IBAction func settings(sender: AnyObject) {
    }
}