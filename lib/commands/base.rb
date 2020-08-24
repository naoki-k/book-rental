module Commands
  class Base
    include ActiveModel::Model

    def initialize(attributes = {})
      super
    end

    def validate!
      raise ValidationError, errors unless valid?
    end

    def persisted?
      false
    end
  end
end
