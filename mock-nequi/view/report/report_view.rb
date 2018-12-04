class ReportView < View

  attr_accessor :element_list, :limit

  def initialize element_list:, limit:
    @element_list = element_list
    @limit = limit
  end

  def show
    clean_screen
    report
    puts "Press enter to continue"
    gets
  end

  def report
    if @element_list.length > 0 and limit > 0
        puts 'ELEMETS:'
        count = 0
        @element_list.each do |element|
          break unless count < @limit
          puts element_list
          puts
          count += 1
        end
    else
        puts 'There are no elemets to show'
    end
  end
end
