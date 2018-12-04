class ReportView < View

  def initialize transaction_movements:, transfer_movements:, limit:
    @transaction_movements = transaction_movements
    @transfer_movements = transfer_movements
    @limit = limit
    yield(self) if block_given?
  end

  def show
    clean_screen
    report_transactions
    report_transfers
    puts "\nPress enter to continue"
    gets
  end

  def report_transactions
    if @transaction_movements.length > 0 and @limit > 0
      puts 'TRANSACTIONS:'
    else
      puts 'There are no transactions to show'
    end
    puts ''
    count = 0
    @transaction_movements.each do |transaction_movement|
      break unless count < @limit
      transaction = transaction_movement.transaction
      puts ' Date: ' + transaction_movement.date.to_s
      puts ' Amount: $%0.2f' % transaction_movement.amount_money
      puts ' Transaction type: ' + transaction.type
      puts ''
      count += 1
    end
  end

  def report_transfers
    if @transfer_movements.length > 0 and @limit > 0
      puts 'TRANSFERS:'
    else
      puts 'There are no transfers to show'
    end
    puts ''
    count = 0
    @transfer_movements.each do |transfer_movement|
      break unless count < @limit
      transfer = transfer_movement.transfer
      puts ' Date: ' + transaction_movement.date.to_s
      puts ' Amount: $%0.2f' % transaction_movement.amount_money
      puts ' Receiver ' + transfer.receiver.email
      puts ''
      count += 1
    end
  end
end
