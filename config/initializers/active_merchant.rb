
ActiveMerchant::Billing::BogusGateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")  
ActiveMerchant::Billing::BogusGateway.wiredump_device.sync = true 
ActiveMerchant::Billing::Base.mode = :test

# ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")  
# ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device.sync = true

# login = "AJ7838-05"
# password="balcx9b42ya2028jxlp574dgkqxvbsgj"
# CARD_GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new(login: login, password: password)
CARD_GATEWAY = ActiveMerchant::Billing::BogusGateway.new

paypal_options = {
  login: "dilcom3107-facilitator1_api1.gmail.com",
  password: "CKLUN3WRK4UQVY6T",
  signature: "ADPDQzmpt5xdp.O0PA0Ci99r7hb4As9BgUCKlqRlJT.j09ozd.neOjtK"
}
PAYPAL_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)