module CrcEstimator
  # Allows accessing config variables from harmony.yml like so:
  # CarbonCalculatedApi[:domain] => domain.com
  def self.[](key)
    unless @config
      raw_config = File.read(File.join(File.dirname(__FILE__), "../../config", "crc_estimator.yml"))
      @config = YAML.load(raw_config)[Rails.env].symbolize_keys
    end
    @config[key]
  end
  
  def self.[]=(key, value)
    @config[key.to_sym] = value
  end
  
  def self.calculated_session
    @session ||= Calculated::Session.create(:server => ::CrcEstimator[:api_server], :api_key => ::CrcEstimator[:api_key])
  end
end