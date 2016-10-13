require "kemal"
require "http/client"

require "./ls/localizer"
require "./ls/formatter"
require "./ls/job"

# get "/" do |env|

#   localizer = Ls::Localizer.new env.params.query["locale"]? ? env.params.query["locale"] : "en"
#   formatter = Ls::Formatter.new localizer, ["date", "time"]

#   env.response.content_type = "text/csv"

#   formatter.format(File.new("1.csv")) do |chunk|
#     chunk
#   end

#   env.response.close
# end


ws "/" do |socket|
  puts "socket opened"
	socket.on_message do |message|
		job = Ls::Job.from_json(message);

    # socket.send("pong");

    (1..999).each do |n|
      socket.send(n.to_s)
    end

    # socket.stream(true) do |stream|
    #   (1..99999999999).each { |n| stream << n }
    #   break
    # end

    # HTTP::Client.get(job.url) do |response|
    #   if response.headers.fetch("X-Status-Code", 200).to_i != 200
    #     socket.close
    #     break
    #   end
      
    #   localizer = Ls::Localizer.new(job.locale)
    #   formatter = Ls::Formatter.new(localizer, job.columns)

    #   socket.stream(false) do |stream|

    #     formatter.format(File.new("1.csv")) do |chunk|
    #       stream << chunk
    #     end
    #   end

    # end
	end
end


Kemal.run