//
//  PodcastCell.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 29.01.2022.
//

import UIKit
import SDWebImage

class PodcastCelll: UITableViewCell {
    
   
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    @IBOutlet weak var podcastImageView: UIImageView!
    
    var podcast: Podcasts! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"
            
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else { return }
            podcastImageView.sd_setImage(with: url, completed: nil)
        }
    }
}
