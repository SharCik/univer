class Bid < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, format: { with: VALID_EMAIL_REGEX }

  belongs_to :city
  belongs_to :university
  belongs_to :departament
  belongs_to :specialty
  belongs_to :magistracy

  after_create :send_bid_telegram


  def send_bid_telegram
    message = "MyUniver, новая заявка:\nИмя: #{self.name}\nEmail: #{self.mail}\nТелефон: #{self.phone}\nКомментарий: #{self.comment}"
    TelegramBotWorker.new.perform_async(message)
  end

end
