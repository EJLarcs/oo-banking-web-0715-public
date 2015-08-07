require_relative 'bank_account.rb'

class Transfer
  # code here

  attr_accessor :sender, :receiver, :amount, :status
  attr_writer :balance


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? == true && status == "pending" && @sender.balance > @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    elsif both_valid? == true && @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif both_valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if both_valid? == true && status == "complete"

    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
    end
  end

end
