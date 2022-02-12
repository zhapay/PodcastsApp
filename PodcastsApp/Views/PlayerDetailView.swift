//
//  PlayersDetailView.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 05.02.2022.
//

import UIKit

class PlayerDetailView: UIView {
    
    var episodee: Episodes! {
        didSet {
            titleLabel.text = episodee.title
            authorLabel.text = episodee.author
            
            guard let url = URL(string: episodee.imageUrl ?? "") else { return }
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    @IBAction func handleDismiss(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBAction func playButton(_ sender: Any) {
    }
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var episodeImageView: UIImageView!
    
}



