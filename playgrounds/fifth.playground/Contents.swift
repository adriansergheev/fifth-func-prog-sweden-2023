/*:
 ## Product types
 */
struct Product<A, B> {
	let first: A
	let second: B
}

// Product <Bool, Bool> = 2 * 2 = 4
Product<Bool, Bool>(first: true, second: true)
Product<Bool, Bool>(first: true, second: false)
Product<Bool, Bool>(first: false, second: true)
Product<Bool, Bool>(first: false, second: false)


// Product <Bool, Void> = 2 * 1 = 2
Product<Bool, Void>(first: true, second: Void())
Product<Bool, Void>(first: false, second: Void())


// Product <Bool, Never> = 2 * 0 = 0

//Product<Bool, Never>(first: true, second: ??)


/*:
 ## Sum types
 */
enum Sum<A, B> {
	case left(A)
	case right(B)
}


// Sum <Bool, Bool> = 2 + 2 = 4
Sum<Bool, Bool>.left(true)
Sum<Bool, Bool>.left(false)
Sum<Bool, Bool>.right(true)
Sum<Bool, Bool>.right(false)


// Sum <Bool, Void> = 2 + 1 = 3
Sum<Bool, Void>.left(true)
Sum<Bool, Void>.left(false)
Sum<Bool, Void>.right(Void())


// Sum <Bool, Never> = 2 + 0 = 2
Sum<Bool, Never>.left(true)
Sum<Bool, Never>.left(false)
// Sum<Bool, Never>.right


/*:
 ## Pattern Matching
 */

let sum = Sum<Bool, Void>.left(true)

switch sum {
case let .left(value):
	value
case .right:
	break
}


// Expression Pattern
let point = (1, 2)

switch point {
case (0, 0):
	print("(0, 0) is at the origin.")
case (-2...2, -2...2):
	print("(\(point.0), \(point.1)) is near the origin.")
default:
	print("The point is at (\(point.0), \(point.1)).")
}




/*:
 ## Error Handling
 */
enum NetworkError: Error {
	case unreachable
}

func throwingFetch(url: String) throws -> String {
	if Bool.random() {
		return "Website contents..."
	} else {
		throw NetworkError.unreachable
	}
}



func unthrowingFetch(url: String) -> Result<String, NetworkError> {
	return Bool.random()
	? .success("Website contents...")
	: .failure(.unreachable)
}


//unthrowingFetch(url: "someUrl")


/*:

 ### References

 [ep4-algebraic-data-types](https://www.pointfree.co/episodes/ep4-algebraic-data-types)

 [Patterns - Match and destructure values](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/patterns/
 )

 [Validated (Pointfree.co)](https://github.com/pointfreeco/swift-validated)
 */

