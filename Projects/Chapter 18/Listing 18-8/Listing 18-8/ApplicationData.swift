
import SwiftUI
import AVFoundation

class ViewData {
   var captureSession: AVCaptureSession!
   var stillImage: AVCapturePhotoOutput!
   var previewLayer: AVCaptureVideoPreviewLayer!
   var imageOrientation: UIImage.Orientation!
}
class ApplicationData: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
   @Published var path = NavigationPath()
   @Published var picture: UIImage?

   var cameraView: CustomPreviewLayer!
   var viewData: ViewData

   override init() {
      cameraView = CustomPreviewLayer()
      viewData = ViewData()
      super.init()

      Task(priority: .background) {
         await receiveNotification()
      }
   }
   func receiveNotification() async {
      let center = NotificationCenter.default
      let name = await UIDevice.orientationDidChangeNotification
      for await _ in center.notifications(named: name, object: nil) {
         if viewData.captureSession != nil {
            await MainActor.run {
               viewData.previewLayer.frame = cameraView.view.bounds
               let videoOrientation = getCurrentOrientation()
               let connection = viewData.previewLayer.connection
               connection?.videoOrientation = videoOrientation
            }
         }
      }
   }
   func getAuthorization() async {
      let granted = await AVCaptureDevice.requestAccess(for: .video)
      await MainActor.run {
         if granted {
            self.prepareCamera()
         } else {
            print("Not Authorized")
         }
      }
   }
   func prepareCamera() {
      viewData.captureSession = AVCaptureSession()
      if let device = AVCaptureDevice.default(for: AVMediaType.video) {
         if let input = try? AVCaptureDeviceInput(device: device) {
            viewData.captureSession.addInput(input)
            viewData.stillImage = AVCapturePhotoOutput()
            viewData.captureSession.addOutput(viewData.stillImage)
            showCamera()
         } else {
            print("Not Authorized")
         }
      } else {
         print("Not Authorized")
      }
   }
   func showCamera() {
      let width = cameraView.view.bounds.size.width
      let height = cameraView.view.bounds.size.height

      viewData.previewLayer = AVCaptureVideoPreviewLayer(session: viewData.captureSession)
      viewData.previewLayer.videoGravity = .resizeAspectFill
      viewData.previewLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)

      let videoOrientation = getCurrentOrientation()
      let connection = viewData.previewLayer.connection
      connection?.videoOrientation = videoOrientation

      let layer = cameraView.view.layer
      layer.addSublayer(viewData.previewLayer)
      Task(priority: .background) {
         viewData.captureSession.startRunning()
      }
   }
   func getCurrentOrientation() -> AVCaptureVideoOrientation {
      var currentOrientation: AVCaptureVideoOrientation!
      let deviceOrientation = UIDevice.current.orientation

      switch deviceOrientation {
         case .landscapeLeft:
            currentOrientation = AVCaptureVideoOrientation.landscapeRight
            viewData.imageOrientation = .up
         case .landscapeRight:
            currentOrientation = AVCaptureVideoOrientation.landscapeLeft
            viewData.imageOrientation = .down
         case .portrait:
            currentOrientation = AVCaptureVideoOrientation.portrait
            viewData.imageOrientation = .right
         case .portraitUpsideDown:
            currentOrientation = AVCaptureVideoOrientation.portraitUpsideDown
            viewData.imageOrientation = .left
         default:
            if UIDevice.current.orientation.isLandscape {
               currentOrientation = AVCaptureVideoOrientation.landscapeRight
               viewData.imageOrientation = .up
            } else {
               currentOrientation = AVCaptureVideoOrientation.portrait
               viewData.imageOrientation = .right
            }
            break
      }
      return currentOrientation
   }
   func takePicture() {
      let settings = AVCapturePhotoSettings()
      viewData.stillImage.capturePhoto(with: settings, delegate: self)
   }
   func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
      let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
      let scale = scene?.screen.scale ?? 1

      if let imageData = photo.cgImageRepresentation() {
         picture = UIImage(cgImage: imageData, scale: scale, orientation: viewData.imageOrientation)
         path = NavigationPath()
      }
   }
}

