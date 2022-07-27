class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(reader_id: self.id,magazine_id: magazine.id,price: price)
  end
  
  def total_subcription_price
    subscriptions.sum(:price)
  end

  def cancel_subscription(magazine)
    Subscription.destroy(magazine.id)
  end
  
  

end