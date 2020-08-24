module Commands
  module Books
    class DeleteBook < Base
      attr_accessor :uid, :nickname

      validates :uid, presence: true
      validates :nickname, presence: true, length: { maximum: 20 }
    end
  end
end
