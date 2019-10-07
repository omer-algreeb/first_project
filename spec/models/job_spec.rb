require 'rails_helper'

RSpec.describe Job, type: :model do

  let(:list) {
    [Job.create, Job.create, Job.create]
  }

  let(:job) { Job.new }

  before do
    list
  end
    
  it 'the test created job ' do 
    expect(Job.all.count).to eq(3)
  end

  it 'the test type name ' do 
    job.name = 'omer'
    expect(job.name).to  eq('omer')
  end

end
