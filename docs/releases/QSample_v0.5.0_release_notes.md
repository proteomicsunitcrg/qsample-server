# QSample v0.5.0 Release Notes

Release date: 2026-06-09

## Repositories and tags

This release is tagged as `v0.5.0` in both QSample repositories.

Frontend:

* Repository: `qsample-client`
* Tag: `v0.5.0`
* Commit: `1cb1b1d`
* Commit message: `Open embedded sample QC links in new tabs`

Backend:

* Repository: `qsample-server`
* Tag: `v0.5.0`
* Commit: `747bfe8`
* Commit message: `Set default application chart configs`

## Summary

QSample v0.5.0 is a major development release focused on improving the user interface, making request browsing easier, consolidating processing logs, improving Sample Preparation QC navigation, and completing the backend support for dynamic chart configuration.

This release also includes the CORS/security hardening work introduced around `v0.4.5`, which is important for production deployment and controlled frontend/backend communication.

## Main user-facing changes

### Requests page redesign

The Requests page has been reorganized into a clearer two-column layout:

* Search and filters are shown on the left.
* Loaded requests are shown on the right.
* The request table is easier to read and navigate.
* The loading spinner is now shown in the request results area.
* Request links now open in a new browser tab.

This should make it easier to search requests without losing the current view.

### Sample Preparation QC redesign

The Sample Preparation QC section has been redesigned to make browsing QC data easier:

* QC methods are shown in a left-side menu.
* Charts and the date selector are shown in the main right-side panel.
* The layout is more consistent with the rest of the application.
* QC method links now open in a new browser tab.
* The first click from the embedded home tab and later clicks from the QC section now behave consistently.

### Processing logs tab

Processing logs have been moved into their own tab.

This tab now groups:

* Recently processed request files.
* Recently processed Sample Preparation QC files.

This separates operational processing information from the main request browsing area.

### Chart display improvements

Several chart display improvements were added:

* Better handling of dynamic Plotly chart resizing.
* Improved empty states for quantification charts.
* Improved formatting of scientific values.
* Better coloring of protein group bars by replicated sample group.
* PTM charts rendered as stacked bars where appropriate.
* Legacy per-chart help icons were removed to reduce visual noise.

## Backend changes

### Dynamic chart configuration system

The backend now includes the core infrastructure for configurable dynamic charts.

Main additions include:

* Chart configuration database schema.
* Chart configuration entities and repositories.
* Basic charts API endpoint.
* Chart DTO responses.
* Page-level chart configuration endpoint.
* Chart parameters included in page chart configuration.
* Chart data endpoint for the dynamic chart system.
* Dynamic chart filtering by application constraints.
* Dynamic request plot ordering support.
* Creation date support in dynamic chart APIs.
* Application chart configuration backend.
* Seed data for initial chart configurations.
* Default chart visibility configuration.
* Default application chart configurations.

### Application-specific chart behavior

The release adds or improves chart logic for several application contexts:

* Request data availability calculation.
* Prioritization of Agendo requests with QSample data.
* Dynamic provider for modification sites charts.
* Stacked provider support for PTM charts.
* Disabled quantification heatmap for histone PTM.
* Secondary reactions dynamic chart seed fix.
* Legacy request status chart hidden from application configuration.

### Agendo-related support

This release improves the integration with Agendo-backed request data:

* Local development environment setup.
* Request data availability support.
* Agendo status endpoint.
* Prioritization of requests that have QSample data.

## Security and configuration changes

This release includes the CORS/security hardening work introduced after `v0.4.4` and included in the `v0.4.5` line.

Relevant changes include:

* CORS origins are controlled through an explicit allowlist.
* The allowlist can be configured through `QSAMPLE_CORS_ORIGINS`.
* Wildcard CORS is avoided.
* HTTP security configuration and authorization rules were refactored.
* Test user setup endpoints and methods were removed.
* JWT secret persistence and entrypoint behavior were improved.
* Development healthcheck was aligned after auth hardening.
* Development configuration was aligned with the Agendo-backed mode.
* An example development environment file was added for the Agendo password.

This is important for production because allowed frontend origins should be configured explicitly rather than relying on permissive CORS behavior.

## Frontend changes

### Layout and navigation

Main frontend improvements include:

* Home requests and QC panels organized into tabs.
* Requests page redesigned as a search-first interface.
* Requests home layout polished.
* Request details panel and dialogs improved.
* Sample Preparation QC home tab polished.
* Sample Preparation QC page layout redesigned.
* Sample Preparation QC details layout polished.
* Sample Preparation QC navigation and styling polished.
* Processing logs layout polished.

### Link behavior

Several navigation actions now open in a new browser tab:

* Request links.
* Sample Preparation QC links from the main QC section.
* Sample Preparation QC links from the embedded home tab.

This makes it easier to inspect requests or QC plots without losing the current overview.

### Chart UI improvements

Frontend chart improvements include:

* Dynamic Plotly charts resize after rendering.
* Dynamic chart y-axis values are formatted with scientific decimals.
* Quantification empty states are clearer.
* PTM charts are rendered as stacked bars.
* Protein group bars are colored by replicated sample group.
* Per-chart help icons were removed from dynamic charts.
* Top-bar help now links to the QC parameters wiki.

### External tools

QGenerator actions are now linked to the external application.

## Local environment file handling

The local frontend environment file is now ignored by git:

* `src/assets/env.js`

This avoids accidentally committing local development URLs or machine-specific IP addresses.

For local development or temporary internal testing, `env.js` can still exist locally, but it should not be tracked by git.