# What’s new in QSample v0.5.0

QSample v0.5.0 includes a major interface refresh focused on making the application easier to browse, easier to understand, and more comfortable to use during daily work.

The main changes affect the Requests page, Sample Preparation QC, Processing logs, request navigation, chart administration, and chart display.

## 1. Requests page redesign

The Requests page has been reorganized into a clearer search-first layout.

Previously, request search, filters, dashboards, and request tables were more mixed together. In this version, the page is split into two main areas:

* The left side contains the request filters and search tools.
* The right side contains the loaded requests table.

This makes the workflow clearer: first filter or search, then inspect the results.

* Filters are grouped on the left side.
* Loaded requests are shown on the right side.
* The request table is easier to read.
* The layout is more stable and less visually crowded.
* The loading spinner now appears in the results area, so it is clearer when requests are being loaded.
* A quick “Last 3 months” option has been added to make recent request searches faster.
* The selected date range is preserved when navigating, so users do not lose the current context when moving between pages.

## 2. Request links now open in a new tab

Request links now open in a new browser tab.

When clicking on a request from the request list, QSample opens the request in a separate tab instead of replacing the current page.

This makes it easier to inspect one or more requests while keeping the original request list open.

## 3. Sample Preparation QC redesign

The Sample Preparation QC section has been redesigned to make QC browsing more comfortable.

The new layout separates the QC method list from the QC plots.

* QC methods are shown in a left-side menu.
* The selected QC plots are shown in the main panel.
* The date selector is displayed together with the plots.
* The layout is cleaner and more similar to the rest of QSample.
* The QC page is easier to navigate because the method list remains visible.

## 4. Sample Preparation QC links now open in a new tab

Sample Preparation QC links now open in a new browser tab.

QC method links now behave consistently from both places where they appear:

* From the Sample Preparation QC home tab.
* From inside the Sample Preparation QC section itself.

The first click and later clicks now behave the same way.

## 5. Processing logs moved to a dedicated tab

Processing information has been moved into its own Processing logs tab.

The Processing logs tab now groups operational information that was previously mixed with other dashboard elements.

It includes:

* Recently processed request files.
* Recently processed Sample Preparation QC files.

## 6. Application chart administration

A new chart administration option has been added for admin users.

Admin users can now access a chart configuration view from the new chart admin icon. This allows each QSample application to be associated with the charts that should be displayed for that specific application.

This is useful because different applications do not always need the same plots or QC summaries.

Current functionality:

* Admin users can review the chart configuration per application.
* Applications can be associated with their corresponding charts.
* Chart visibility can be managed at application level.
* This prepares QSample for a more flexible and application-specific chart system.

This option is only available for admin users.

## 7. Chart display improvements

Several chart-related improvements have been added.

* Charts resize more reliably after loading.
* Empty chart states are clearer when no data is available.
* Scientific values are displayed with improved formatting, using up to two decimals where appropriate.
* Protein group bars are colored by replicated sample group.
* Per-chart help icons were removed from dynamic charts.
* The top-bar help link now points to the QC parameters wiki.

## 8. Better request data visibility

QSample now handles request data availability more clearly.

* Requests with QSample data are shown and prioritized more clearly.
* Direct request lookup has been improved.
* Request information panels have been polished.
* Request details dialogs are easier to read.

## 9. QGenerator access

QGenerator actions are now linked to the external application.

QSample can now direct users to the external QGenerator application from the relevant action links.

## 10. Not included yet / future work

Some parts of the dynamic chart system are not included yet in this release and remain planned for future development.

Pending work:

* Allow admins to create new charts dynamically from the interface.
* Extend the dynamic chart configuration system to Sample Preparation QC.
* Continue improving how charts are configured, grouped and displayed depending on the application type.
