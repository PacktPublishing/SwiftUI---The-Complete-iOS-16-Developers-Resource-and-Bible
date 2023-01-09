
let sequencetext = repeatElement("Hello", count: 5)
let sequencenumbers = stride(from: 0, to: 10, by: 2)
let finalsequence = zip(sequencetext, sequencenumbers)

for (text, number) in finalsequence {
   print("\(text) - \(number)")
}
