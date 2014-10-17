require 'spec_helper'
require 'payload/factory_resolver'

describe Payload::FactoryResolver do
  describe '#resolve' do
    it 'returns a new factory from the container, block, and decorators' do
      block = double('block')
      factory = double('factory')
      container = double('container')
      decorators = double('decorators')
      definition = Payload::FactoryResolver.new(block)
      allow(Payload::Factory).
        to receive(:new).
        with(container, block, decorators).
        and_return(factory)

      result = definition.resolve(container, decorators)

      expect(result).to eq(factory)
    end
  end

  describe "#new" do
    it "instantiates an instance from the factory" do
      instance = double("instance")
      block = double("block")
      factory = double("factory", new: instance)
      container = double("container")
      decorators = double("decorators")
      definition = Payload::FactoryResolver.new(block)
      allow(Payload::Factory).
        to receive(:new).
        with(container, block, decorators).
        and_return(factory)

      result = definition.new(container, decorators)

      expect(result).to eq(instance)
    end
  end
end
