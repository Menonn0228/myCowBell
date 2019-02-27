//
//  ViewController.swift
//  Cowbell
//
//  Created by Nikhil Menon on 12/13/17.
//  Copyright © 2017 NikhilMenon. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {



    @IBOutlet weak var bell: UIImageView!
    
    
    var noise:AVAudioPlayer = AVAudioPlayer()
    let sound_file = Bundle.main.path(forResource: "cowbell_noise", ofType: ".m4a")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{ //Changes status bar to white.
        return .lightContent
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) { //If device shakes
        //Update the image.
        //Play the cowbell sound.
        //Revert the image.
        

            //Initialize Sound if Sound is enabled
            do{
                try noise = AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound_file!))
                
            } catch{
                print("Noise Ended")
            }   //End Sound
        
            self.bell.image = UIImage(named: "clang") //Update image
            noise.play()    //Play the sound
            print("You shook the device!")  //Debug
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){   //Sets a timer for half a second
                self.bell.image = UIImage(named: "still") //Revert image to still.
            }
        
    }
    
}

