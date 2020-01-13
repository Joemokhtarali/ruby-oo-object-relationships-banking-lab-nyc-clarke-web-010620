require_relative './bank_account.rb'
require "pry"
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    # binding.pry 
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end
  
  def reject_transfer
    
  end 


end


# transfer = Transfer.new( Bank_account.new("mary"), Bank_account.new("meg")  25)