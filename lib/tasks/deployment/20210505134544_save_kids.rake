namespace :after_party do
  desc 'Deployment task: save_kids'
  task save_kids: :environment do
    puts "Running deploy task 'save_kids'"

    # Put your task implementation HERE.
    Kid.each do |kid|
      kid.update_tokens
      kid.save(validate: false)
    end

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
