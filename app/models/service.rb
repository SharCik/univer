class Service < ActiveRecord::Base


    mount_uploader :service_image, ImageUploader

end
