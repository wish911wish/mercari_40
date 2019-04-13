class UserEvaluation < ApplicationRecord
  validates_uniqueness_of :evaluator_id,  uniquness: { scope: :evaluatee_id }
  belongs_to :evaluator, class_name: "User", foreign_key: :evaluator_id
  belongs_to :evaluatee, class_name: "User", foreign_key: :evaluatee_id
end
