module Services
  class UniqueIdGenerator
    def self.generate
      Time.current.strftime("%H%M%S%L#{SecureRandom.random_number(100)}")
    end
  end
end
