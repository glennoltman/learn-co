require 'learn'

KNOWN_COMMANDS = [
  'test',
  'help',
  'version',
  '-v',
  '--version',
  'submit',
  'open',
  'reset',
  'whoami',
  'directory'
]

NON_PRE_CONFIG_COMMANDS = [
  'reset', 'whoami', 'directory', 'help', 'version', '--version', '-v'
]

# Default to running tests
if ARGV.empty? || ARGV.none? {|arg| KNOWN_COMMANDS.include?(arg)}
  ARGV.unshift('test')
end

if ['-v', '--version'].include?(ARGV.first)
  puts Learn::VERSION
  exit
end

Learn::OptionsSanitizer.new(ARGV).sanitize!

if !(NON_PRE_CONFIG_COMMANDS.include?(ARGV[0]))
  system('learn-config')
end

Learn::CLI.start(ARGV)
