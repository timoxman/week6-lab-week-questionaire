require_relative 'helpers/helper'

include SessionHelpers

feature 'User adds a new Question' do
  scenario 'when browsing the homepage' do
    expect(Question.count).to eq(0)
    visit '/'
    click_button 'Add Question'
    fill_in :questionText, with: "do you own a dog?"
    fill_in :answerType, with: "YesNo"
    expect(Question.count).to eq(1)
    expect(question.questionText).to eq('do you own a dog?')
    expect(question.answerType).to eq('YesNo')
  end

end