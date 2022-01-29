class Abstract < ApplicationRecord

  validates :problem, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain problem"}

  validates :methodology, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain methodology"}

  validates :feasibility, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain feasibility field"}

  validates :results, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain results"}

  validates :impact, presence: true, uniqueness: false, format: {with: /[
    a-zA-Z0-9_-]{2}/,message: "must contain impact"}

  belongs_to :project
end
