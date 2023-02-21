/*:
## Exercise - Enumerations
 
 Define a `Suit` enum with four possible cases: `clubs`, `spades`, `diamonds`, and `hearts`.
 */
enum Suit{
    case clubs
    case spades
    case diamands
    case hearts
}

//:  Imagine you are being shown a card trick and have to draw a card and remember the suit. Create a variable instance of `Suit` called `cardInHand` and assign it to the `hearts` case. Print out the instance.
var cardInHand = Suit.hearts
var secondCard : Suit = .hearts
//:  Now imagine you have to put back the card you drew and draw a different card. Update the variable to be a spade instead of a heart.
cardInHand = Suit.spades
secondCard = .spades

//:  Imagine you are writing an app that will display a fun fortune (i.e. something like "You will soon find what you seek.") based on cards drawn. Write a function called `getFortune(cardSuit:)` that takes a parameter of type `Suit`. Inside the body of the function, write a switch statement based on the value of `cardSuit`. Print a different fortune for each `Suit` value. Call the function a few times, passing in different values for `cardSuit` each time.
func getFortune(cardSuit : Suit){
    switch cardSuit{
    case .spades:
        print("You will write beautiful code that is both elegant and efficient")
    case .hearts:
        print("Your debugging skilles will be put to the test, but you will emerge victourious ")
    case .clubs:
    print("You will soon embark on a coding journey")
    case .diamands:
    print("A new programming language or tool will pique your interest and lead to great things")
    default:
        print("Unexpected errors will arise, but with determination and skill, you will conqure them.")
    }
}
getFortune(cardSuit: .hearts)
getFortune(cardSuit: .clubs)
getFortune(cardSuit: .spades)
getFortune(cardSuit: .diamands)

//:  Create a `Card` struct below. It should have two properties, one for `suit` of type `Suit` and another for `value` of type `Int`.
struct Card{
    enum Value{
        case ace, one, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
    var suit: Suit
    var value: Value
}

//:  How many values can playing cards have? How many values can `Int` be? It would be safer to have an enum for the card's value as well. Inside the struct above, create an enum for `Value`. It should have cases for `ace`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`, `jack`, `queen`, `king`. Change the type of `value` from `Int` to `Value`. Initialize two `Card` objects and print a statement for each that details the card's value and suit.
var cardUno = Card(suit: .diamands, value: .ace)
print("Your card is the \(cardUno.value) of \(cardUno.suit)")

/*:
page 1 of 2  |  [Next: App Exercise - Swimming Workouts](@next)
 */
