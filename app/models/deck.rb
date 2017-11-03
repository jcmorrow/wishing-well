class Deck < CardStore
  def initialize
    super
    7.times { add_card Copper.new }
    3.times { add_card Estate.new }
  end
end
