
import Foundation
struct Photos : Codable {
	let format : String?
	let width : Int?
	let height : Int?
	let filename : String?
	let id : Int?
	let author : String?
	let author_url : String?
	let post_url : String?

	enum CodingKeys: String, CodingKey {

		case format = "format"
		case width = "width"
		case height = "height"
		case filename = "filename"
		case id = "id"
		case author = "author"
		case author_url = "author_url"
		case post_url = "post_url"
	}

	
    var photoURL: String? {
        if let id = id {
            return "https://picsum.photos/300/300?image=\(id.description)"
        }
        return nil
    }
}


