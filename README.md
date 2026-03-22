# Distroless Navidrome container

Bare-bones distroless Navidrome container image.

## Running

Mount data directory at `/var/lib/navidrome`.

Example:

```bash
docker run -it --rm -v ./data:/var/lib/navidrome \
  ghcr.io/simons-containers/distroless-navidrome:latest
```

## Building

| Arg | Description |
|---|---|
| `NAVIDROME_VERSION` | Version of Navidrome to use

Build container using build-args from versions.yaml:

```bash
docker build -t \
  distroless-navidrome:$(yq -r .navidrome versions.yaml) \
  $(yq -r 'to_entries | .[] | "--build-arg \(.key | ascii_upcase)_VERSION=\(.value)"' versions.yaml) -f Containerfile .
```

## License

Repository contents (e.g., `Containerfile`, build scripts, and configuration) are licensed under the **MIT License**.

Software included in built container images (such as **Navidrome**) are provided under their respective upstream licenses and are not covered by the MIT license for this repository.

## Acknowledgements

This project depends on a number of upstream components and data sources:

- **Navidrome** - Your Personal Streaming Service
  https://www.navidrome.org