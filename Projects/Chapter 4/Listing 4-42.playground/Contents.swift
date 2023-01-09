
import Foundation

var counter = 0

func startTimer() {
   Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timerref) in
      report(timer: timerref)
   }
}
func report(timer: Timer) {
   print("\(counter) times")
   counter += 1
   if counter > 10 {
      print("Finished")
      timer.invalidate()
   }
}
startTimer()
