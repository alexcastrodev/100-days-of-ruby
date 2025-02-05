require 'singleton'

class Logger
  include Singleton

  def log(message)
    puts "[LOG] #{message}"
  end
end

Logger.instance.log("Application started")
# both instance has the same reference
puts Logger.instance == Logger.instance