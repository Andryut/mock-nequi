class OperationView

  def initialize input_nodes:
    @input_nodes = input_nodes
  end

  def show
    input_data = Hash.new
    input_nodes.each do |input_node|
      input_data.merge!(input_node.play)
    end
    return input_data
  end
end
