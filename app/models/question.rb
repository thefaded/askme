class Question < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  validates :answer, presence: true, on: :update

  def self.get_questions(id)
    sql = "SELECT id, text, created_at FROM questions WHERE (user_id == #{id} AND answer is null or answer = '')"
    return ActiveRecord::Base.connection.execute(sql)
  end
end
