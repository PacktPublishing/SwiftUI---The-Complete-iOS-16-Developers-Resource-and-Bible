
import SwiftUI
import AVFoundation

class ViewData: NSObject {
   var playerItem: AVPlayerItem!
   var player: AVPlayer!
   var playerLayer: AVPlayerLayer!
}
class ApplicationData: ObservableObject {
   @Published var playing: Bool = false
   @Published var progress: CGFloat = 0
   var customVideoView: CustomPlayerView!
   var viewData: ViewData

   init() {
      customVideoView = CustomPlayerView()
      viewData = ViewData()

      let bundle = Bundle.main
      let videoURL = bundle.url(forResource: "videotrees", withExtension: "mp4")

      let asset = AVURLAsset(url: videoURL!)
      viewData.playerItem = AVPlayerItem(asset: asset)
      viewData.player = AVPlayer(playerItem: viewData.playerItem)

      viewData.playerLayer = AVPlayerLayer(player: viewData.player)
      viewData.playerLayer.frame = UIScreen.main.bounds
      let layer = customVideoView.view.layer
      layer.addSublayer(viewData.playerLayer)

      let interval = CMTime(value: 1, timescale: 2)
      viewData.player.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { time in
         let duration = self.viewData.playerItem.duration
         let position = time.seconds / duration.seconds
         self.progress = CGFloat(position)
      })
      Task(priority: .background) {
         await receiveNotification()
      }
      Task(priority: .background) {
         await rewindVideo()
      }
   }
   func rewindVideo() async {
      let center = NotificationCenter.default
      let name = NSNotification.Name.AVPlayerItemDidPlayToEndTime
      for await _ in center.notifications(named: name, object: nil) {
         let finished = await viewData.playerItem.seek(to: CMTime.zero)
         if finished {
            await MainActor.run {
               playing = false
               progress = 0
            }
         }
      }
   }
   func receiveNotification() async {
      let center = NotificationCenter.default
      let name = await UIDevice.orientationDidChangeNotification
      for await _ in center.notifications(named: name, object: nil) {
         if viewData.playerItem != nil {
            await MainActor.run {
               viewData.playerLayer.frame = customVideoView.view.bounds
            }
         }
      }
   }
   func playVideo() {
      if viewData.playerItem.status == .readyToPlay {
         if playing {
            viewData.player.pause()
            playing = false
         } else {
            viewData.player.play()
            playing = true
         }
      }
   }
}

