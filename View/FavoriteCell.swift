//
//  FavoriteCell.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 8.11.2023.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    //MARK: - Properties
    var podcastCoreData: PodcastCoreData? {
        didSet { configure() }
    }
    
    private let podcastImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .purple
        return imageView
    }()
    private let mediaNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    private let artistNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Artist Name"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    private var stackView: UIStackView!
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Helpers
extension FavoriteCell {
    private func style() {
        stackView = UIStackView(arrangedSubviews: [podcastImageView, mediaNameLabel, artistNameLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            podcastImageView.heightAnchor.constraint(equalTo: podcastImageView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    private func configure() {
        guard let podcastCoreData = self.podcastCoreData else { return }
        let viewModel = FavoriteViewModel(podcastCoreData: podcastCoreData)
        self.podcastImageView.kf.setImage(with: viewModel.imageUrlPodcast)
        self.mediaNameLabel.text = viewModel.podcastMediaNameLabel
        self.artistNameLabel.text = viewModel.podcastArtistNameLabel
    }
}
