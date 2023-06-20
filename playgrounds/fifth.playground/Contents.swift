/*:
 ## Product types
 */
struct Product<A, B> {
	let first: A
	let second: B
}


/*:
 ## Sum types
 */
enum Sum<A, B> {
	case left(A)
	case right(B)
}

/*:
 ## Pattern Matching
 */

let sum = Sum<Bool, Void>.left(true)


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

/*:

 ### References

 [ep4-algebraic-data-types](https://www.pointfree.co/episodes/ep4-algebraic-data-types)

 [Patterns - Match and destructure values](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/patterns/
 )

 [Validated (Pointfree.co)](https://github.com/pointfreeco/swift-validated)
 */

