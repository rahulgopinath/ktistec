require "../framework"

Ktistec::Server.run do
  Log.setup_from_env
  spawn do
    TaskWorker.clean_up_running_tasks
    task_worker = TaskWorker.new
    loop do
      unless task_worker.work
        sleep 5.seconds
      end
    end
  end
end
