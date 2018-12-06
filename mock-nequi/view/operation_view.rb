class OperationView < View

  attr_accessor :input_views

  def initialize input_views:
    @input_views = input_views
  end

  def show
    clean_screen
    form = Hash.new
    @input_views.each do |input_view|
      form.merge!(input_view.show)
    end
    return form
  end
  
end
