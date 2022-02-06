FactoryBot.define do
  factory :user do
    nickname              {'so'}
    lastname      {'芳本'}
    firstname     {'創'}
    lastname_ruby {'ヨシモト'}
    firstname_ruby {'ソウ'}
    birthday {'20021231'}
    email {'so2921@icloud.com'}
    password {'S140321y'}
    password_confirmation {'S140321y'}
  end
end