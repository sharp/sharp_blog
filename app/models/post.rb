class Post < ActiveRecord::Base

  acts_as_taggable_on :tags
  
  paginates_per 20

  has_many                :comments, :dependent => :destroy
  has_many                :approved_comments, :class_name => 'Comment'

  before_validation       :generate_slug, :apply_filter
  validates_presence_of   :title, :slug, :body

  attr_accessible :title, :body, :tag_list, :slug, :published_at
  
  auto_html_for :body do
    html_escape
    image
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
  
  def validate_published_at_natural
    errors.add("published_at_natural", "Unable to parse time") unless published?
  end

  attr_accessor :minor_edit
  def minor_edit
    @minor_edit ||= "1"
  end

  def minor_edit?
    self.minor_edit == "1"
  end

  def published?
    published_at?
  end

  def to_param
    "#{id}-#{slug.parameterize}"
  end


  class << self
    def build_for_preview(params)
      post = Post.new(params)
      post.generate_slug
      post.set_dates
      post.apply_filter
      TagList.from(params[:tag_list]).each do |tag|
        post.tags << Tag.new(:name => tag)
      end
      post
    end

    def find_recent(options = {})
      tag = options.delete(:tag)
      options = {
        :order      => 'posts.published_at DESC',
        :conditions => ['published_at < ?', Time.zone.now],
        :limit      => DEFAULT_LIMIT
        }.merge(options)
        if tag
          find_tagged_with(tag, options)
        else
          find(:all, options)
        end
      end

      def find_all_grouped_by_month
        posts = find(
        :all,
        :order      => 'posts.published_at DESC',
        :conditions => ['published_at < ?', Time.now]
        )
        month = Struct.new(:date, :posts)
        posts.group_by(&:month).inject([]) {|a, v| a << month.new(v[0], v[1])}
      end
    end

    def destroy_with_undo
      transaction do
        self.destroy
        return DeletePostUndo.create_undo(self)
      end
    end

    def month
      published_at.beginning_of_month
    end

    def apply_filter
      self.edited_at = Time.now
      self.body_html = body
    end

    def denormalize_comments_count!
      Post.update_all(["approved_comments_count = ?", self.approved_comments.count], ["id = ?", self.id])
    end

    def generate_slug
      self.slug = Hz2py.do(self.title, :join_with => '-', :to_simplified => true).gsub(/\W/, "-").gsub(/(-){2,}/, '-').to_s
    end
  end
