//
//  AboutViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
import UIKit
import AVKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var videoContainerView: UIView!

    private let scrollView = UIScrollView()
    private let stackView: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.spacing = 16
        return st
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "About Cofiesto"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .left
        return label
    }()

    private let introLabel: UILabel = {
        let label = UILabel()
        label.text = """
Cofiesto is a specialty-inspired concept built around coffee, food and culture.
We believe in quality, authenticity and attention to detail — from the beans we brew to the dishes we serve.
"""
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let missionLabel: UILabel = {
        let label = UILabel()
        label.text = """
Our mission is simple: create a cozy atmosphere with great taste and genuine hospitality.
Feel the craft in every cup.
"""
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()

    private let sloganLabel: UILabel = {
        let label = UILabel()
        label.text = "Coffee. Craft. Culture."
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(red: 30/255, green: 85/255, blue: 60/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()

    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPatternBackground()
        setupVideo()
        setupScrollAndText()
    }

    private func setupPatternBackground() {
        if let pattern = UIImage(named: "CofiestoPattern") {
            view.backgroundColor = UIColor(patternImage: pattern)
        }

        let overlay = UIView()
        overlay.backgroundColor = UIColor.white.withAlphaComponent(0.85)
        overlay.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overlay)

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: videoContainerView.bottomAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupVideo() {
        guard let url = Bundle.main.url(forResource: "CofiestoTuru", withExtension: "mp4") else {
            print("VIDEO TAPILMADI")
            return
        }

        player = AVPlayer(url: url)
        player?.isMuted = true

        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        playerLayer?.frame = videoContainerView.bounds

        videoContainerView.layer.addSublayer(playerLayer!)
        player?.play()

        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player?.currentItem,
            queue: .main
        ) { _ in
            self.player?.seek(to: .zero)
            self.player?.play()
        }
    }

    private func setupScrollAndText() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: videoContainerView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])

        [titleLabel, introLabel, missionLabel, sloganLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer?.frame = videoContainerView.bounds
    }
}
