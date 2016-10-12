require "kemal"
require "./ls/localizer"
require "./ls/formatter"

get "/" do |env|
  localizer = Ls::Localizer.new env.params.query["locale"] ? env.params.query["locale"] : "en"
  formatter = Ls::Formatter.new localizer, ["date", "time"]

  env.response.content_type = "text/csv"

  formatter.format() do |chunk|
    env.response << chunk
  end
  "Hello World!"
end

Kemal.run