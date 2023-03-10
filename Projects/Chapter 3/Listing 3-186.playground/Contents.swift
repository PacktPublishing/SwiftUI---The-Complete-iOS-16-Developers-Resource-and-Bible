
protocol SalaryProtocol {
   func showMoney(name: String, money: Double)
}
struct Salary: SalaryProtocol {
   func showMoney(name: String, money: Double) {
      print("The salary of \(name) is \(money)")
   }
}
struct Employees {
   var name: String
   var money: Double
  
   var delegate: SalaryProtocol
    
   func generatereport() {
      delegate.showMoney(name: name, money: money)
   }
}
let salary = Salary()
let employee1 = Employees(name: "John", money: 45000, delegate: salary)

employee1.generatereport()  // "The salary of John is 45000.0"
