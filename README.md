<div align="center">

# APIndex

**The API Catalog Platform for Teams**

Organize, test, mock, and manage your APIs in one place.

[Website](https://apindex.dev) · [Documentation](https://docs.apindex.dev/) · [Pricing](https://apindex.dev/#pricing) · [Report Bug](https://github.com/APIndex/apindex/issues/new?template=bug_report.yml) · [Request Feature](https://github.com/APIndex/apindex/issues/new?template=feature_request.yml)

</div>

---

## Features

- **API Catalog** — Import and organize OpenAPI/Swagger specs with collections, tags, and search
- **API Tester** — Execute requests against your APIs with environment variable support
- **Mock Server** — Generate mock APIs from your specs with one click
- **Network Map** — Visualize API dependencies and relationships
- **Role-Based Access** — Fine-grained RBAC with custom roles
- **LDAP/SSO** — Enterprise authentication integration
- **MCP Server** — AI agent access via Model Context Protocol (Claude, Cursor, etc.)
- **Multi-Tenant** — Isolated organizations with separate catalogs
- **Audit Log** — Track all changes with retention policies
- **Self-Hosted** — Deploy on your infrastructure, your data stays yours

## Quick Start

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/APIndex/apindex/main/install.sh | bash
```

### Manual Setup

```bash
# Download
curl -O https://raw.githubusercontent.com/APIndex/apindex/main/docker-compose.yml
curl -O https://raw.githubusercontent.com/APIndex/apindex/main/.env.example
cp .env.example .env

# Configure
nano .env  # Set your admin email, password, and secret key

# Start
docker compose up -d
```

APIndex will be available at `http://localhost` (or the port you configured).

## Configuration

See [`.env.example`](.env.example) for all configuration options.

| Variable | Description | Default |
|----------|-------------|---------|
| `SECRET_KEY` | Encryption key (required, generate a random string) | - |
| `FIRST_SUPERUSER_EMAIL` | Admin email created on first start | `admin@apindex.local` |
| `FIRST_SUPERUSER_PASSWORD` | Admin password | `changeme` |
| `PORT` | Port to expose | `80` |
| `LICENSE_KEY` | Pro/Business license key | - |
| `INSTANCE_NAME` | License ID (from activation email) | - |

## Upgrading

```bash
docker compose pull
docker compose up -d
```

Database migrations run automatically on startup.

## Plans

| Feature | Starter | Pro | Business | Enterprise |
|---------|:-------:|:---:|:--------:|:----------:|
| API Catalog | Unlimited | Unlimited | Unlimited | Unlimited |
| Users | 3 | 25 | Unlimited | Unlimited |
| Environments | 1 | Unlimited | Unlimited | Unlimited |
| API Tester | Yes | Yes | Yes | Yes |
| Network Map | Yes | Yes | Yes | Yes |
| RBAC & Custom Roles | - | Yes | Yes | Yes |
| Multi-Tenant | - | - | Yes | Yes |
| Audit Log | - | - | Yes | Yes |
| LDAP/SSO | - | - | Yes | Yes |
| On-Prem Support | - | - | - | Yes |
| SLA & Dedicated Support | - | - | - | Yes |
| Price | Free | $49/mo | $119/mo | Contact us |

[View pricing](https://apindex.dev/#pricing)

## MCP Integration (AI Agents)

APIndex includes a built-in MCP server for AI agent access. Connect Claude Desktop, Cursor, or any MCP-compatible client:

```json
{
  "mcpServers": {
    "apindex": {
      "url": "https://your-apindex.com/mcp",
      "headers": {
        "X-API-Key": "apx_your_key_here"
      }
    }
  }
}
```

Create an API key in **Admin > MCP Keys**. [Full MCP documentation](https://docs.apindex.dev/#mcp)

## Support

- **Community**: [GitHub Issues](https://github.com/APIndex/apindex/issues) & [Discussions](https://github.com/APIndex/apindex/discussions)
- **Email**: contact@apindex.dev
- **Enterprise**: Dedicated support with SLA — [contact us](mailto:contact@apindex.dev)

## License

APIndex is licensed under the [Business Source License 1.1](LICENSE). After 4 years, each release converts to Apache 2.0.

You are free to use APIndex for any purpose, including production, as long as you don't offer it as a managed service.
