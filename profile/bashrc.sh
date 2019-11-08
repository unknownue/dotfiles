# Retrieve functions definitions
declare > .bashrc.new
# Retrieve aliases
alias >> .bashrc.new
# Retrieve env
echo "export $(env | grep ^PATH=)" >> .bashrc.new