# copyright: 2018, The Authors

title "check if chocolatey & git package are installed"

describe chocolatey_package('git') do
  it { should be_installed }
end
