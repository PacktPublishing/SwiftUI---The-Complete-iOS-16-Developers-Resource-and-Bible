
protocol SalaryProtocol {
   func showMoney(name: String, money: Double)
}
struct Salary: SalaryProtocol {
   func showMoney(name: String, money: Double) {
      print("The salary of \(name) is \(money)")
   }
}
struct BasicSalary: SalaryProtocol {
   func showMoney(name: String, money: Double) {
      if money > 40000 {
         print("Salary is over the minimum")
      } else {
         print("The salary of \(name) is \(money)")
      }
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
var employee1 = Employees(name: "John", money: 45000, delegate: salary)

employee1.delegate = BasicSalary()
employee1.generatereport()  // "Salary is over the minimum"
