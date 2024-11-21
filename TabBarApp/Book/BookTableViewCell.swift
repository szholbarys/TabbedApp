//
//  BookTableViewCell.swift
//  TabBarApp
//
//  Created by Zholbarys on 22.11.2024.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
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
    
    func configure(with book: Book) {
        titleLabel.text = book.title
        publisherLabel.text = book.publisher
        yearLabel.text = "Published: \(book.releaseYear)"
        coverImageView.image = UIImage(named: book.coverImageName)
    }
}
