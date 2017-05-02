class Task
  @@all_tasks = []
  attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_method(:==) do |another_task|
    self.description.==(another_task.description)
  end

  define_singleton_method(:all) do
    # @@all_tasks
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch('description')
      tasks.push(Task.new({:description => description}))
    end
    tasks
  end
  define_method(:save) do
    #  @@all_tasks.push(self)
    DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}');")
   end
  define_singleton_method(:clear) do
    @@all_tasks = []
  end
end
