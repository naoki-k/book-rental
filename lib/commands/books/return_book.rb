module Commands
  module Books
    class ReturnBook < Base
      attr_accessor :uid, :title, :author, :summary, :status, :nickname

      validates :uid, presence: true
      validates :nickname, presence: true, length: { maximum: 20 }
      validate :ensure_rented

      private

      def ensure_rented
        errors.add(:base, 'this book is returned') unless status == 'rented'
      end
    end
  end
end
