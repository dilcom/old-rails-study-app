class PaypalPayment < ActiveRecord::Base
  has_one :order, as: :payment

  def purchase(order_p, p_ip)
    return false if order_p.paid?
    response = PAYPAL_GATEWAY.purchase(order_p.total, express_purchase_options(p_ip))
    if response.success?
      # order_p.update_attribute(:purchased_at, Time.now)
      order_p.update_attributes(payment: self, purchased_at: Time.now, ip: p_ip)
    end
    response.success?
  end

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      # you can dump details var if you need more info from buyer
      details = PAYPAL_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end

  private

  def express_purchase_options(p_ip)
    {
      :ip => p_ip,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end
end
