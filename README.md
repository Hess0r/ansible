# Automated installation of my dev environment

## Usage

Use the following command to run the playbook:

```bash
ansible-playbook --diff main.yml
```

If sudo requires password then add the `--ask-become-pass` option

```bash
ansible-playbook --diff --ask-become-pass main.yml
```

### Configuration

To overwrite variables, create a values.yml file:

```
mkdir -p "$HOME/.config/dotfiles" && vim "$HOME/.config/dotfiles/values.yml"
```
> If `vim` is not installed use whatever text editor is available.

And reference it in the `ansible-playbook` command:

```bash
ansible-playbook --diff --extra-vars "@$HOME/.config/dotfiles/values.yml" main.yml
```

For encrypted values, created via `ansible-vault` use either the `--ask-vault-pass`, option, or save it in a file, and reference it in the command:

```
mkdir -p "$HOME/.config/dotfiles" && vim "$HOME/.config/dotfiles/vault-password.txt"

ansible-playbook --diff --extra-vars "@$HOME/.config/dotfiles/values.yml" --vault-password-file "$HOME/.config/dotfiles/vault-password.txt" main.yml
```

Encrypted variable values can be created with the following command:

```
ansible-vault encrypt_string --vault-password-file "$HOME/.config/dotfiles/vault-password.txt" "secret" --name "variable_name"
cat myfile | ansible-vault encrypt_string --vault-password-file "$HOME/.config/dotfiles/vault-password.txt" --stdin-name "variable_name"
```

Currently the following variables are supported:
- git_user_name (string, required)
- git_user_email (string, required)
- exclude_roles (array)
- neovim_version (string, branch, or tag name)
- node_version (string)
- ssh key (dictionary, each pair of the key should be an entry)
- go_version (string: '1.18', '1.17.8', '1.16.15')

## Testing

The playbook can be tested in a docker container. To build the base image run the [build.sh](build.sh) script.
