//
//  RegionViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 16.01.26.
//
import UIKit
import MapKit

class RegionViewController: UIViewController {

    var bean: CoffeeBean!

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var flavorsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!

    private let countryCoords: [String : CLLocationCoordinate2D] = [
        "Ethiopia": CLLocationCoordinate2D(latitude: 9.145, longitude: 40.489),
        "Kenya": CLLocationCoordinate2D(latitude: -1.2921, longitude: 36.8219),
        "Rwanda": CLLocationCoordinate2D(latitude: -1.9403, longitude: 29.8739),
        "Burundi": CLLocationCoordinate2D(latitude: -3.3731, longitude: 29.9189),
        "Tanzania": CLLocationCoordinate2D(latitude: -6.3690, longitude: 34.8888),

        "Brazil": CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
        "Colombia": CLLocationCoordinate2D(latitude: 4.5709, longitude: -74.2973),
        "Peru": CLLocationCoordinate2D(latitude: -9.1900, longitude: -75.0152),
        "Bolivia": CLLocationCoordinate2D(latitude: -16.2902, longitude: -63.5887),

        "Guatemala": CLLocationCoordinate2D(latitude: 15.7835, longitude: -90.2308),
        "Costa Rica": CLLocationCoordinate2D(latitude: 9.7489, longitude: -83.7534),
        "El Salvador": CLLocationCoordinate2D(latitude: 13.7942, longitude: -88.8965),
        "Honduras": CLLocationCoordinate2D(latitude: 15.2000, longitude: -86.2419),
        "Nicaragua": CLLocationCoordinate2D(latitude: 12.8654, longitude: -85.2072),

        "Indonesia": CLLocationCoordinate2D(latitude: -0.7893, longitude: 113.9213),
        "Papua New Guinea": CLLocationCoordinate2D(latitude: -6.314993, longitude: 143.95555),
        "Vietnam": CLLocationCoordinate2D(latitude: 14.0583, longitude: 108.2772),

        "Yemen": CLLocationCoordinate2D(latitude: 15.5527, longitude: 48.5164)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = bean.name

        setupUI()
        setupPattern()
        setupConstraints()
        setupMap()
    }

    private func setupUI() {

        // COFIESTO Brand Beige Background
        view.backgroundColor = UIColor(red: 222/255, green: 214/255, blue: 195/255, alpha: 1)

        // MAP (no forced dark mode)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isPitchEnabled = false
        mapView.isRotateEnabled = false
        mapView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: .realistic)

        // ORIGIN (Brand Accent Green)
        originLabel.text = bean.name
        originLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        originLabel.textColor = UIColor(red: 24/255, green: 68/255, blue: 54/255, alpha: 1)
        originLabel.textAlignment = .center
        originLabel.translatesAutoresizingMaskIntoConstraints = false

        // REGION Label
        regionLabel.text = bean.region
        regionLabel.font = .systemFont(ofSize: 18, weight: .medium)
        regionLabel.textColor = UIColor(red: 37/255, green: 94/255, blue: 69/255, alpha: 1)
        regionLabel.textAlignment = .center
        regionLabel.translatesAutoresizingMaskIntoConstraints = false

        // FLAVORS
        flavorsLabel.text = bean.flavors
        flavorsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        flavorsLabel.textColor = UIColor(white: 0.2, alpha: 1)
        flavorsLabel.textAlignment = .center
        flavorsLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupPattern() {
        if let pattern = UIImage(named: "CofiestoPattern") {
            let patternView = UIImageView(image: pattern)
            patternView.contentMode = .scaleAspectFill
            patternView.alpha = 0.05
            patternView.translatesAutoresizingMaskIntoConstraints = false
            view.insertSubview(patternView, at: 0)

            NSLayoutConstraint.activate([
                patternView.topAnchor.constraint(equalTo: view.topAnchor),
                patternView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                patternView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                patternView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalToConstant: 260),

            originLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 18),
            originLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            originLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            regionLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 6),
            regionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            regionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            flavorsLabel.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 6),
            flavorsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            flavorsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            flavorsLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }

    private func setupMap() {
        guard let coordinate = countryCoords[bean.name] else {
            print("No map coordinate for \(bean.name)")
            return
        }

        let region = MKCoordinateRegion(center: coordinate,
                                        latitudinalMeters: 2_000_000,
                                        longitudinalMeters: 2_000_000)
        mapView.setRegion(region, animated: false)

        let pin = MKPointAnnotation()
        pin.title = bean.name
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}
