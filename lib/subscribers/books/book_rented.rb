module Subscribers
  module Books
    class BookRented
      def call(event)
        book = ::Book.find_by(uid: event.data[:uid])
        book&.update(status: 'rented')
      end
    end
  end
end
