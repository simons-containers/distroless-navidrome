[![Current Version](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/release.svg)](https://github.com/simons-containers/distroless-navidrome/pkgs/container/distroless-navidrome) [![Tags](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/tags.svg)](https://github.com/simons-containers/distroless-navidrome/pkgs/container/distroless-navidrome) <br> ![Current Size](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/size.svg) ![Wasted Size](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/wasted.svg) ![Efficiency](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/efficiency.svg) <br> ![Critical](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/critical.svg) ![High](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/high.svg) ![Medium](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/medium.svg) ![Low](https://raw.githubusercontent.com/simons-containers/distroless-navidrome/badges/.badges/main/low.svg) <br> [![Publish Workflow](https://img.shields.io/github/actions/workflow/status/simons-containers/distroless-navidrome/deploy.yaml?label=Publish%20Workflow&logo=github)](https://github.com/simons-containers/distroless-navidrome/actions/workflows/deploy.yaml) [![Update Workflow](https://img.shields.io/github/actions/workflow/status/simons-containers/distroless-navidrome/update-versions.yaml?label=Update%20Workflow&logo=github)](https://github.com/simons-containers/distroless-navidrome/actions/workflows/update-versions.yaml)

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
