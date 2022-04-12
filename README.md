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
ansible-playbook --diff --extra-vars "@/path/to/variables.yml" main.yml
```

Currently the following variables are supported:
- git_user_name (string, required)
- git_user_email (string, required)
- exclude_roles (array)
- neovim_version (string, branch, or tag name)
- node_version (string)
- ssh key (dictionary, each pair of the key should be an entry)

Implementing the use for the following variables is TODO:
- [ ] go_version (this one is going to be tricky, cause of the checksum)

## Testing

The playbook can be tested in a docker container. To build the base image run the [build.sh](build.sh) script.
