module CommandHandlers
  module Books
    class DeleteBook
      def call(command)
        stream = "Domain::Book#{command.uid}"
        entity_data = {
          uid: command.uid,
          status: 'deleted',
          nickname: command.nickname
        }

        repository = AggregateRoot::Repository.new
        order = repository.load(Domain::Book.new(command.uid), stream)
        order.delete(entity_data)
        repository.store(order, stream)
      end
    end
  end
end
