class Listing < ActiveRecord::Base
  #removed as dropbox isn't working
  #if Rails.env.development?  
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpg"
  
  #else
   # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpg",
   #                 :storage => :dropbox,
   #                 :dropbox_credentials => Rails.root.join("config/dropbox.yml") ,
   #                 :path => ":style/:id_:filename"
  #end

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image, attachment_presence: true

  belongs_to :user
  has_many :orders
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :image)
    end


