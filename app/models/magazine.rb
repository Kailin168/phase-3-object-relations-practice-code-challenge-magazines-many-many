class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions
  

  def email_list
    emails = self.readers.map do |reader|
                reader.email
              end
    emails.join(";")
  end 
  
  # Magazine.most_popular
  # returns the Magazine instance with the most subscribers
  
  def self.most_popular
    self.all.max_by do |m|
      m.subscriptions.count
    end

  end
  

end