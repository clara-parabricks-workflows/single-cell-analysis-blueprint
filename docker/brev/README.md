# Docker Compose YAMLs

This directory contains configuration files to assist in creating a custom Brev Launchable environment. For full instructions, please consult our [Creating Custom Brev Resource](../../docs/creating_custom_brev.md) guide.

## File manifest

```
docker/brev/docker-compose-base-2412.yaml       # Don't use this
docker/brev/docker-compose-nb-2412-H100-C.yaml  # Use this if you are selecting H100 instances on Crusoe
docker/brev/docker-compose-nb-2412.yaml         # Use this for any other resource
```