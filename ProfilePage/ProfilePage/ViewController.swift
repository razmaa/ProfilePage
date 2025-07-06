//
//  ViewController.swift
//  ProfilePage
//
//  Created by nika razmadze on 06.07.25.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - UI Elements

    private let profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ProfilePic"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "John Doe"
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let followButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Follow"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 8, leading: 12, bottom: 8, trailing: 12
        )

        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Passionate iOS developer with a love for clean code and beautiful UI. \
        Always eager to learn new technologies and improve user experience.
        """
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func makeStatStack(title: String, count: Int) -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textAlignment = .center

        let countLabel = UILabel()
        countLabel.text = "\(count)"
        countLabel.font = .systemFont(ofSize: 18, weight: .bold)
        countLabel.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [titleLabel, countLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutUI()
    }

    // MARK: - Layout

    private func layoutUI() {
        let mainStack = UIStackView(arrangedSubviews: [
            makeProfileHeader(),
            bioLabel,
            makeStatisticsSection()
        ])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.alignment = .fill
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.layoutMargins = .init(top: 40, left: 20, bottom: 20, right: 20)
        mainStack.isLayoutMarginsRelativeArrangement = true

        view.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func makeProfileHeader() -> UIStackView {
        let headerStack = UIStackView(arrangedSubviews: [
            profileImageView,
            nameLabel,
            followButton
        ])
        headerStack.axis = .horizontal
        headerStack.alignment = .center
        headerStack.spacing = 16

        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        return headerStack
    }

    private func makeStatisticsSection() -> UIStackView {
        let followers = makeStatStack(title: "Followers", count: 1234)
        let following = makeStatStack(title: "Following", count: 345)
        let posts = makeStatStack(title: "Posts", count: 56)

        let statsStack = UIStackView(arrangedSubviews: [followers, following, posts])
        statsStack.axis = .horizontal
        statsStack.distribution = .fillEqually
        statsStack.alignment = .center
        statsStack.spacing = 10
        return statsStack
    }
}



