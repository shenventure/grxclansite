class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable     

  validates :gamertag, presence: true, length: { maximum: 20 }  

  has_attached_file :avatar, 
    :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
    :url => "/system/:attachment/:id/:basename_:style.:extension",
    :styles => {
      :thumb    => ['100x100#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
  },
    :convert_options => {
    :thumb    => '-set colorspace sRGB -strip',
    :preview  => '-set colorspace sRGB -strip',
    :large    => '-set colorspace sRGB -strip',
    :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


#   before_save :extract_dimensions
#   serialize :dimensions  

#   def image?
#     avatar_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
#   end
 

# private

#   def extract_dimensions
#     return unless image?
#       tempfile = avatar.queued_for_write[:original]
#     unless tempfile.nil?
#       geometry = Paperclip::Geometry.from_file(tempfile)
#       self.dimensions = [geometry.width.to_i, geometry.height.to_i]
#     end
#   end
end  