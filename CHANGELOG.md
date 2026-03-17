# Changelog


## [1.1.0] - 2026-03-17

## What's New

### Stripe Integration
- Checkout flow for purchasing Pro, Business, and Enterprise licenses
- License activation with 2FA (License ID as second factor)
- Billing portal for subscription management
- Webhook handling for `checkout.session.completed`, `customer.subscription.created`, `customer.subscription.updated`, and `customer.subscription.deleted`
- Auto-activation after successful Stripe checkout

### MCP Improvements
- Bearer token auth support (alongside X-API-Key) for OpenWebUI and other MCP clients
- Fixed nginx trailing slash redirect causing 307 errors

### Network Map
- Tuned d3 force simulation for better visual cluster separation
- Variable charge strength and link distance based on node connectivity

### License Server
- Improved activation email with step-by-step setup instructions and documentation links
- Idempotent migration for `activity_logs.updated_at` column
- Fixed documentation URLs to `docs.apindex.dev`

### UI Fixes
- Sidebar navigation is now scrollable when menu items overflow

### Other
- GitHub Action to sync releases to public repo (APIndex/apindex)
- Disable "Generate Mocks" button when no mock environment is configured

All notable changes to APIndex will be documented in this file.
