module HelperMethods
  def accept_alert
    page.driver.browser.switch_to.alert.accept
    sleep 0.1
  end
end

RSpec.configuration.include HelperMethods, :type => :request
