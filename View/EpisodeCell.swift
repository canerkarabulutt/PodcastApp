//
//  EpisodeCell.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 6.11.2023.
//

import UIKit
import Kingfisher

class EpisodeCell: UITableViewCell {
    //MARK: - Properties
    var episode: Episode? {
        didSet { configure() }
    }
    
        var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .lightGray
        progressView.tintColor = .purple
        progressView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        progressView.layer.cornerRadius = 12
        progressView.setProgress(Float(0), animated: true)
        progressView.isHidden = true
        return progressView
    }()
    
    private let episodeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    private let pubDateLabel: UILabel = {
       let label = UILabel()
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "PubDate Label"
        return label
    }()
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.text = "Title Label"
        return label
    }()
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.text = "Description Label"
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
extension EpisodeCell {
    private func setup() {
        episodeImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView = UIStackView(arrangedSubviews: [pubDateLabel, titleLabel, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func layout() {
        addSubview(episodeImageView)
        addSubview(stackView)
        addSubview(progressView)
        
        NSLayoutConstraint.activate([
            episodeImageView.heightAnchor.constraint(equalToConstant: 100),
            episodeImageView.widthAnchor.constraint(equalToConstant: 100),
            episodeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            episodeImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: episodeImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: episodeImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            progressView.heightAnchor.constraint(equalToConstant: 20),
            progressView.leadingAnchor.constraint(equalTo: episodeImageView.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: episodeImageView.trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: episodeImageView.bottomAnchor)
        ])
    }
    private func configure() {
        guard let episode = self.episode else { return }
        let viewModel = EpisodeViewModel(episode: episode)
        self.episodeImageView.kf.setImage(with: viewModel.profileImageUrl)
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
        self.pubDateLabel.text = viewModel.pubDate
    }
}
