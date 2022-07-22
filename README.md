# Docker Compose WordPress

LEMP stack network containers for WordPress development.

## Usage

1. Rename `.env-example` to `.env` and update contents.
2. `mkcert -install` **TODO - give better instructions** (for Windows, download binary mkcert-v1.4.4-windows-amd64.exe for mkcert, copy to `C:/mkcert`, rename to `mkcert.exe`, add `C:/mkcert` to Windows PATH, `cd /nginx/certs`, **TODO - add commands, etc**)
* here's a how to, no need to use Chocolatey if the above was done [https://www.haveiplayedbowie.today/blog/posts/secure-localhost-with-mkcert/](https://www.haveiplayedbowie.today/blog/posts/secure-localhost-with-mkcert/ "Install mkcert on Windows")
3. Check `php.dockerfile` for additional options
4. WordPress: Either copy an existing project to, or download WordPress and unzip in `wordpress` or skip and continue for wp-cli option
5. Only if you skipped previous step: `cd wordpress` then run `docker-compose run --rm wp core download`
6. Use wp-cli from project root, example: `docker-compose run --rm wp user list`
7. `docker-compose up -d --build site`
