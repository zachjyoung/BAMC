# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beat, :class => 'Beats' do
    title "MyString"
  end
end
