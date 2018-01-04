# CarrierWave.configure do |config|
# config.fog_credentials = {
#
#     :provider                         => 'Google',
#     :google_storage_access_key_id     => Rails.application.secrets.google_storage_access_key_id,
#     :google_storage_secret_access_key => Rails.application.secrets.google_storage_secret_access_key
#
#     }
#
#     config.fog_directory = Rails.application.secrets.google_bucket
# end

CarrierWave.configure do |config|
  config.fog_credentials = {

    provider: 'Google',
    google_storage_access_key_id: ENV['google_storage_access_key_id'],
    google_storage_secret_access_key: ENV['google_storage_secret_access_key']

  }

config.fog_directory = ENV["google_bucket"]
end
