//
//  GameDetailsViewController.swift
//  TabBarApp
//
//  Created by Zholbarys on 21.11.2024.
//

import UIKit

class GameDetailsViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var game: VideoGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        guard let game = game else { return }
        
        title = game.title
        coverImageView.image = UIImage(named: game.coverImageName)
        titleLabel.text = game.title
        platformLabel.text = "Platform: \(game.platform)"
        yearLabel.text = "Released: \(game.releaseYear)"
        descriptionLabel.text = game.description
    }
}
