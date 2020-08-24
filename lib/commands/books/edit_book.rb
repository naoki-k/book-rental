module Commands
  module Books
    class EditBook < Base
      attr_accessor :uid, :title, :author, :summary, :status, :nickname

      validates :uid, presence: true
      validates :title, presence: true, length: { maximum: 100 }
      validates :author, presence: true, length: { maximum: 100 }
      validates :summary, length: { maximum: 500 }
      validates :nickname, presence: true, length: { maximum: 20 }
    end
  end
end
