require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        region:                ENV['s3_bucket_region'],
        aws_access_key_id:     ENV['s3_access_key'],
        aws_secret_access_key: ENV['s3_secret_key']
    }

    config.fog_directory  = ENV['s3_bucket_name']
  end
end