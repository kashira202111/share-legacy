require 'test_helper'

class ImageUrlTest < ActiveSupport::TestCase
    test "image_url save" do
        image_url = ImageUrl.new({
            subject_id: 0,
            url: "https:hogehoge.com"
        })
        assert image_url.save, "Failed to save"
    end
  # test "the truth" do
  #   assert true
  # end
end
