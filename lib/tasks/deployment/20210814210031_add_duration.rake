namespace :after_party do
  desc 'Deployment task: add_duration'
  task add_duration: :environment do
    puts "Running deploy task 'add_duration'"

    # Put your task implementation HERE.
    TimeLog.each do |time_log|
      time_log.update!(duration_type: :time_range)
    end

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
