class Feedback < ActiveRecord::Base
  validates :email,
    :name,
    :message,
    presence: true,
    length: { minimum: 2 }

  validates_format_of :email,
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "Doesn't look like an email address"
end
