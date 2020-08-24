module Subscribers
  module Books
    class BookReturned
      def call(event)
        book = ::Book.find_by(uid: event.data[:uid])
        book&.update(status: 'returned')
      end
    end
  end
end
