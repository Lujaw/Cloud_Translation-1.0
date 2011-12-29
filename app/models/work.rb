class Work < ActiveRecord::Base
  require "tactful_tokenizer"
  belongs_to :client
  has_many :tasks
  after_create :create_tasks
  validates :content, :presence =>true
  validates :to, :presence =>true
  validates :from, :presence =>true

  private
      def create_tasks
           @tactful_tokenizer ||= TactfulTokenizer::Model.new
            result =  @tactful_tokenizer.tokenize_text(self.content)
            task_reward = (self.reward / result.length)
            0.upto(result.length - 1) do |i|
              task1  = self.tasks.build(:content => result[i], :reward => task_reward)
              task1.save
            end
       end

end
