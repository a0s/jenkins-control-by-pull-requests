class Application
  def self.logger
    @logger ||= begin
      logger = ::Logger.new(STDOUT)
      logger.level = ::Logger::DEBUG
      logger
    end
  end

  def self.root
    File.dirname(__FILE__)
  end

  def self.env
    @env ||= ENV['RAILS_ENV'] || ENV['APP_ENV'] || ENV['RACK_ENV'] || 'development'
  end
end

App = Application
