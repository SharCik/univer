class BidMailer < ApplicationMailer

  default from: "sharcik14@gmail.com"

  def bid_new(bid)
    @bid = Bid.find(bid)
    mail(to: 'sharcik@mail.ru', subject: "Новая заяка!")
  end


end
