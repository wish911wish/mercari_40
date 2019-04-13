class UserEvaluation < ApplicationRecord
  validates_uniqueness_of :evaluator_id,  uniquness: { scope: :evaluatee_id }
  belongs_to :user, foreign_key: :evaluatee_id, inverse_of: :user_evaluations
end
