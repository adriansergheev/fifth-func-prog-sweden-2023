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


func fetchData(from url: URL) async -> Result<Data, Error> {
	do {
		let (data, _) = try await URLSession.shared.data(from: url)
		return .success(data)
	} catch {
		return .failure(error)
	}
}

func decodeResponse(from data: Data) -> Result<Response, Error> {
	do {
		let response = try JSONDecoder().decode(Response.self, from: data)
		return .success(response)
	} catch {
		return .failure(error)
	}
}

func createImage(from data: Data) -> UIImage? {
	return UIImage(data: data)
}

let value = await fetchData(from: url)
	.flatMap(decodeResponse)

switch value {
case let .success(response):
	let url = URL(string: response.hdUrl)!
	let result = await fetchData(from: url)
default:
	break
}




if let (data, _) = try? await URLSession.shared.data(from: url),
	 let response = try? JSONDecoder().decode(Response.self, from: data),
	 let (imageData, _) = try? await URLSession.shared.data(from: URL(string: response.hdUrl)!) {
	UIImage(data: imageData)
}

