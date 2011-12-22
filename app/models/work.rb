class Work < ActiveRecord::Base
  require "tactful_tokenizer"
  belongs_to :client
  has_many :tasks
  after_create :create_tasks

    private




    def sentences(num_sentences, text)
        @tactful_tokenizer ||= TactfulTokenizer::Model.new
        result =  @tactful_tokenizer.tokenize_text text
        output = ""
        0.upto([num_sentences, result.length].min - 1) do |i|
          output << "#{result[i]} "
        end
        output
      end


      def create_tasks
           @tactful_tokenizer ||= TactfulTokenizer::Model.new
            result =  @tactful_tokenizer.tokenize_text(self.content)
            0.upto(result.length - 1) do |i|
              task1  = self.tasks.build(:content => result[i])
              task1.save
            end
       end

end




