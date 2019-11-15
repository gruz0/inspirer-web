# frozen_string_literal: true

require 'dry/transaction'
require 'dry/transaction/operation'

class BaseService
  def method_missing(name, *args, &block)
    return super unless self.class.transactions.key?(name)

    input, step_args = args

    input ||= {}
    step_args ||= {}

    transactions[name] ||= self.class.transactions[name].new

    steps = transactions[name].steps.map(&:name)

    step_args.merge!(validate_step_args(name)) if transactions[name].steps.detect { |s| s.name == :validate }
    step_args.merge!(with_step_args(name).slice(*steps))

    transactions[name].with_step_args(step_args).call(input)
  end

  def respond_to_missing?(name, include_private = false)
    self.class.transactions.key?(name) || super
  end

  def transactions
    @transactions ||= {}
  end

  def with_step_args(_name)
    {}
  end

  private

  def validate_step_args(name)
    Hash(validate: [contract_for(name)])
  end

  def contract_for(name)
    klass = [
      self.class.name.split('::').tap(&:pop),
      'Contracts',
      "#{name.to_s.camelize}Contract"
    ].join('::')

    Object.const_get(klass)
  end
end
