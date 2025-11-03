//
//  ViewController.swift
//  lab6(6)
//
//  Created by Aya on 22.11.2025.
//

import UIKit
import AVFoundation

struct TrackItem{
    let title: String
    let image: String
    let soundFileName: String
    let artist: String
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var trackCoverImageView: UIImageView!
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    
    
    
    var player: AVAudioPlayer?
    var currentItem = 0
    var isPlaying: Bool = false
    var timer: Timer?
    

    let tracks: [TrackItem] = [
        TrackItem(title: "Rihanna - love song", image:"rihanna", soundFileName:"song1", artist: "Rihanna"),
        TrackItem(title: "Lana Del Rey - diet mountain dew", image:"lana", soundFileName:"song2", artist:"Lana Del Rey"),
        TrackItem(title: "M'dee - нужна", image: "mdee", soundFileName: "song3", artist: "M'dee"),
        TrackItem(title: "Rihanna - diamonds", image: "rihanna", soundFileName: "song4", artist: "Rihanna"),
        TrackItem(title: "91 - senorita", image:"91", soundFileName: "song5", artist: "91"),
        TrackItem(title: "Lana Del Rey - west coast", image: "lana", soundFileName: "song6", artist: "Lana Del Rey"),
        TrackItem(title: "M'dee - падаем", image: "mdee", soundFileName: "song7", artist: "M'dee"),
        TrackItem(title: "Rihanna - Kiss it better", image:"rihanna", soundFileName: "song8", artist: "Rihanna")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTrackUI()
    }
    
    func updateTrackUI(){
        let track = tracks[currentItem]
        trackTitleLabel.text = track.title
        artistLabel.text = track.artist
        trackCoverImageView.image = UIImage(named: track.image)
        playPauseButton.setImage(UIImage(systemName: "playpause.fill"), for: .normal)
        isPlaying = false
        player?.stop()
        timer?.invalidate()
        if let url = Bundle.main.url(forResource: track.soundFileName, withExtension: "mp3"){
            player = try? AVAudioPlayer(contentsOf: url)
        }
        if let player = player{
            progressSlider.minimumValue = 0
            progressSlider.maximumValue = Float(player.duration)
            progressSlider.value = 0
            
            updateTimeLabels()
        }else{
            progressSlider.value = 0
            currentTimeLabel.text = "0:00"
            durationLabel.text = "0:00"
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String{
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    func updateTimeLabels(){
        guard let player = player else {return}
        currentTimeLabel.text = formatTime(player.currentTime)
        durationLabel.text = formatTime(player.duration)
        progressSlider.value = Float(player.currentTime)
        
    }
    
    func startTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){[weak self] _ in
            self?.updateTimeLabels()
        }
    }

    
    @IBAction func progressSliderChanged(_ sender: UISlider) {
        guard let player = player else {return}
        player.currentTime = TimeInterval(sender.value)
        updateTimeLabels()
    }
    
    
    @IBAction func playPauseTapped(_ sender: Any) {
        guard let player = player else {return}
        if isPlaying{
            player.pause()
            playPauseButton.setImage(UIImage(systemName: "playpause.fill"), for: .normal)
            timer?.invalidate()
        }else{
            player.play()
            playPauseButton.setImage(UIImage(systemName: "playpause.fill"), for: .normal)
            startTimer()
        }
        isPlaying.toggle()
    }
    
    @IBAction func previousTapped(_ sender: Any) {
        currentItem = (currentItem - 1 + tracks.count) % tracks.count
        updateTrackUI()
    }
    
    
    @IBAction func nextTapped(_ sender: Any) {
        currentItem = (currentItem + 1) % tracks.count
        updateTrackUI()
    }
    
    
}
