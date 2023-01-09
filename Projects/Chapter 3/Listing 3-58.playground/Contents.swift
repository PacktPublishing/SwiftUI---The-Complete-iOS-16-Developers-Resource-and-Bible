
var age = 6
var message = "You have to go to "

switch age {
   case 2...4:
      message += "Day Care"
   case 5...11:
      message += "Elementary School"
   case 12...17:
      message += "High School"
   case 18..<22:
      message += "College"
   case 22...:
      message += "Work"
   default:
      message += "Breastfeeding"
}
print(message)  // "You have to go to Elementary School"
