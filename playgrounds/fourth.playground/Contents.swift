/*:
 ## (Optional) Immutability
 */



struct Foo {
	var bar: String
}

var foo = Foo(bar: "foo")
foo.bar = ""




/*:
 ## Functions / Higher Order Functions
 */
func increment(x: Int) -> Int {
	x + 1
}

func applyTwice(f: (Int) -> Int, x: Int) -> Int {
	f(f(x))
}

func applyTwiceCurried(x: Int) -> ((Int) -> Int) -> Int {
	{ f in f(f(x)) }
}

increment(x: 5)
applyTwice(f: increment, x: 5)
applyTwiceCurried(x: 5)(increment)





/*:
 ## Lazy Evaluation
 */

func isPrime(_ n: Int) -> Bool {
	if n < 2 { return false }
	if n == 2 { return true }
	print(n)
	for i in 2..<n {
		if n % i == 0 {
			return false
		}
	}
	return true
}

let numbers = 1_000_000...1_000_500
let primes = numbers.lazy.filter(isPrime)

if let firstPrime = primes.first {
	firstPrime
}

