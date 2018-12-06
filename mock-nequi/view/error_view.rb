class Error < View

  def initialize message:
    @message = message
    yield(self) if block_given?
  end

  def show
    clean_screen
    puts "#{@message}\n"
    puts 'Press enter to continue'
    gets
  end
  
end
