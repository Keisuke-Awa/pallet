class BaseService
  include ActiveModel::Model

  def initialize(*args)
    @options = args.extract_options!
    options.each do |key, value|
      self.class_eval {attr_accessor :"#{key}"}
      self.instance_variable_set("@#{key}", value)
    end
  end

  def run()
    return false if invalid?
    perform
  end

  private
  attr_reader :options

  def perform

  end


end