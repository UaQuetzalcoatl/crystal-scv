require "json"

class Ls::Column
	JSON.mapping(
		"slug": String,
		"type": String,
	)
end