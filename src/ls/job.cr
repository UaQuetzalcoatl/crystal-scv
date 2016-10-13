require "json"
require "./column"

class Ls::Job
	JSON.mapping(
		url: String,
		columns: Array(Column),
    locale: {type: String, default: "en"},
	)
end