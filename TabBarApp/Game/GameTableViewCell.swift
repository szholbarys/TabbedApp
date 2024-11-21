//
//  GameTableViewCell.swift
//  TabBarApp
//
//  Created by Zholbarys on 21.11.2024.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        coverImageView.layer.cornerRadius = 8
    }
    
    func configure(with game: VideoGame) {
        titleLabel.text = game.title
        platformLabel.text = game.platform
        yearLabel.text = "Released: \(game.releaseYear)"
        coverImageView.image = UIImage(named: game.coverImageName)
    }
}
