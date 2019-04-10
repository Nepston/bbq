require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        # provider:              'AWS',
        # region:                ENV['S3_BUCKET_REGION'],
        # aws_access_key_id:     ENV['S3_ACCESS_KEY'],
        # aws_secret_access_key: ENV['S3_SECRET_KEY']

        provider:              Rails.application.credentials.provider,
        region:                Rails.application.credentials.s3_bucket_region,
        aws_access_key_id:     Rails.application.credentials.s3_access_key,
        aws_secret_access_key: Rails.application.credentials.s3_secret_key
    }

    config.fog_directory  = Rails.application.credentials.s3_bucket_name
  end
end