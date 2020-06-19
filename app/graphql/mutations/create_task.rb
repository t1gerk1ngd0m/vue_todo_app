module Mutations
  class CreateTask < GraphQL::Schema::Mutation
    null false

    argument :name, String, required: true

    field :task, Types::TaskType, null: false

    def resolve(**arg)
      task = Task.new(
        name: arg[:name]
      )

      if task.save
        {
          task: task
        }
      else
        raise GraphQL::ExecutionError, task.errors.full_messages.join(", ")
      end
    end
  end
end