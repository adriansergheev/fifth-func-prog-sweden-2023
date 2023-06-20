import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
/*:
 NASA
 */

import UIKit

struct Response: Decodable {
	let explanation: String
	let hdUrl: String
	let title: String

	enum CodingKeys: String, CodingKey {
		case explanation
		case hdUrl = "hdurl"
		case title
	}
}

let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
