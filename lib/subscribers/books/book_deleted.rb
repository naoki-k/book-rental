module Subscribers
  module Books
    class BookDeleted
      def call(event)
        book = ::Book.find_by(uid: event.data[:uid])
        book&.update(status: 'deleted')
      end
    end
  end
end
