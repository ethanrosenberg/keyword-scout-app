class Node
  attr_accessor :name, :parent, :children

  def initialize(name = nil, &block)
    @name = name
    @children = []
    if block_given?
      instance_eval(&block)
    end
  end

  def add(*args, &block)
    tap do
      children << self.class.new(*args, &block).tap { |v| v.parent = self }
    end
  end
end
