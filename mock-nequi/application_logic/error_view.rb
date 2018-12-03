class ErrorView < View

  def initialize message:
    @message = message
  end

  def show
    clean_screen
    puts "#{@message}\n"
    puts 'Press any key to continue'
    gets
  end
end
