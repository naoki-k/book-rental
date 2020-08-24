module Commands
  module Books
    class RentBook < Base
      attr_accessor :uid, :title, :author, :summary, :status, :nickname

      validates :uid, presence: true
      validates :nickname, presence: true, length: { maximum: 20 }
      validate :ensure_returned

      private

      def ensure_returned
        errors.add(:base, 'this book is rented') unless status == 'returned'
      end
    end
  end
end
