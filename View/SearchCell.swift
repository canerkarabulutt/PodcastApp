//
//  SearchCell.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 6.11.2023.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {
    //MARK: - Properties
    var result: Podcast? {
        didSet { configure() }
    }
    
    private let cellImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let trackName: UILabel = {
        let label = UILabel()
        label.text = "Track Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    private let artistName: UILabel = {
        let label = UILabel()
        label.text = "Artist Name"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    private let trackCount: UILabel = {
        let label = UILabel()
        label.text = "Track Count"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    private var stackView: UIStackView!
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - Helpers
extension SearchCell {
    private func setup() {
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.layer.cornerRadius = 12
        stackView = UIStackView(arrangedSubviews: [trackName, artistName, trackCount])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        addSubview(cellImageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            cellImageView.heightAnchor.constraint(equalToConstant: 80),
            cellImageView.widthAnchor.constraint(equalToConstant: 80),
            
            stackView.centerYAnchor.constraint(equalTo: cellImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    private func configure() {
        guard let result = self.result else { return }
        let viewModel = SearchViewModel(podcast: result)
        trackName.text = viewModel.trackName
        trackCount.text = viewModel.trackCountString
        artistName.text = viewModel.artistName
        cellImageView.kf.setImage(with: viewModel.cellImageUrl)
    }
}
