module CommandHandlers
  module Books
    class RentBook
      def call(command)
        stream = "Domain::Book#{command.uid}"
        entity_data = {
          uid: command.uid,
          title: command.title,
          author: command.author,
          summary: command.summary,
          status: 'rented',
          nickname: command.nickname
        }

        repository = AggregateRoot::Repository.new
        order = repository.load(Domain::Book.new(command.uid), stream)
        order.rent(entity_data)
        repository.store(order, stream)
      end
    end
  end
end
