namespace :ow do

  require 'momentum/tasks'

  desc "Print current configuration values for given stack."
  task :config, [:to, :aws_id, :aws_secret] do |t, args|
    require_credentials!(args)
    ow = Momentum::OpsWorks.client(args[:aws_id], args[:aws_secret])
    Momentum::OpsWorks::Config.from_stack(ow, stack_name(args[:to])).each do |k, v|
      puts "#{k}: #{v}"
    end
  end

end
