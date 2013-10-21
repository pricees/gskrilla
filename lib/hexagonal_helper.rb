# This purpose of this module is to assist developers in moving towards a more
# hexagonal architecture
#
# Driver demo program for hexagonal helper
#
#
# require "./hexagonal_helper.rb"
# 
# module Foo; end
# module Foo::Persistence; end
# class Foo::Base; end
# 
# class Foo::Persistence::ActiveRecord
#   def hello
#     puts "This is ActiveRecord"
#   end
# end
#
# class Foo::Persistence::Redis
#   def hello
#     puts "This is Redis"
#   end
# end
# 
# Foo::Base.send :include, HexagonalHelper
# Foo::Base.new("Foo::Persistence::Redis").hello
# Foo::Base.new("Foo::Persistence::ActiveRecord").hello
#
# OUTPUT
#
# => This is Redis
# => This is ActiveRecord
module HexagonalHelper
  attr_reader :connection
 
  class ConnectionError < StandardError; end
 
  # Sets the connection
  #
  # connection_class - String containing full namespace of persistent layer
  #
  # Return instance of connection class
  # Raises Runtime Error
  def initialize(connection_class)
    klass = connection_class.to_s.
      split(/::/).
      inject(Object) { |klass, ns| klass.const_get(ns) }
 
    @connection = klass.new
  rescue NameError
    raise NameError, "No Persistence Adapter named '#{connection_class}'"
  end
 
  # Public: Build a delegate method on the EiginClass 
  #
  # method - method name that connection responds to.
  # Returns a proc
  def build_it!(method)
    block = lambda { |*args| connection.send(method, *args) }
    self.class.send(:define_method, method, block)
  end
 
 
  # You love meta programming, I love meta programming, we all love meta
  # programming
  def method_missing(method, *args, &block)
    @connection.respond_to?(method) || super
 
    # If you got here, that connection responds!
    build_it!(method)[*args]
  end
end
