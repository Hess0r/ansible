# Automated isntallation of my dev environment

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

To overwrite variables, create a values.yml file and reference it in the command:

```bash
ansible-playbook --diff --extra-vars /path/to/variables.yml main.yml
```

## Testing

The playbook can be tested in a docker container. To build the base image run the [build.sh](build.sh) script.
