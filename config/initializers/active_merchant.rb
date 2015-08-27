
ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")  
ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device.sync = true 
ActiveMerchant::Billing::Base.mode = :test

login = "AJ7838-05"
password="balcx9b42ya2028jxlp574dgkqxvbsgj"
GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new(
  login: login,
  password: password
)