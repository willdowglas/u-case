# frozen_string_literal: true

require 'micro/case'

module Micro
  class Case
    include Micro::Attributes::Features::ActiveModelValidations

    def call
      return Failure(:validation_error) { { errors: self.errors } } unless valid?

      __call
    end
  end
end