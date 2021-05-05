if Rails.env.production?
  Sentry.init do |config|
    config.dsn = 'https://68bef547974d4bde822c4e81c3e78c27@o33120.ingest.sentry.io/5741697'
    config.breadcrumbs_logger = [:active_support_logger]

    # Set tracesSampleRate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production
    config.traces_sample_rate = 0.5
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end
end
