class KidUpdateWorker
  include Sidekiq::Worker

  def perform(kid_id)
    Kid.find(kid_id).perform_update_tokens!
  end
end
