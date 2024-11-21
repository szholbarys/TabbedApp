//
//  MovieTableViewCell.swift
//  TabBarApp
//
//  Created by Zholbarys on 22.11.2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
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
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        platformLabel.text = movie.platform
        yearLabel.text = "Released: \(movie.releaseYear)"
        coverImageView.image = UIImage(named: movie.coverImageName)
    }
}
