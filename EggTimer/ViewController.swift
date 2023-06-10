//
//

import UIKit

// Seslerin çalınabilmesi için, Ses çalma Kütüphanesi eklendi.
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titelLabel: UILabel!
    var player: AVAudioPlayer!
    @IBOutlet weak var progressViewtime: UIProgressView!
    
    // zamanlayıyıcıyı oluşturmak.
    var timer = Timer()
    let eggTimes: [String : Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondPassed = 0
    var times = 0

    @IBAction func hardnessPressButton(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressViewtime.progress = 0.0
        secondPassed = 0
        titelLabel.text = hardness


        
        // Zamanlayıcı.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    
    // Zamanlayıcının Kodu.
    @objc func Action(){
        if secondPassed < totalTime{
            secondPassed += 1
            progressViewtime.progress = Float(secondPassed) / Float(totalTime)
        }else{

            timer.invalidate()
            titelLabel.text = "Time Finished"
            playSound(harf: "alarm_sound")
 
        }
        
    }
    
    func playSound(harf:String){
        let url = Bundle.main.url(forResource: harf, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    

}
