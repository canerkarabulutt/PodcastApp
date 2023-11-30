//
//  Extension.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 6.11.2023.
//

import UIKit
import CoreMedia

extension UIImageView {
    func customMode() {
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
extension CMTime {
    func formatString() -> String {
        let totalSecond = Int(CMTimeGetSeconds(self))
        let second = totalSecond % 60
        let minutes = totalSecond / 60
        let formatString = String(format: "%02d: %02d", minutes,second)
        return formatString
    }
}
extension NSNotification.Name {
    static let downloadNotificationName = NSNotification.Name("downloadNotificationName")
}
