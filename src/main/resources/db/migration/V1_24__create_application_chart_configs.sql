CREATE TABLE application_chart_configs (
    id BIGINT NOT NULL AUTO_INCREMENT,
    application_id BIGINT NOT NULL,
    chart_id BIGINT NOT NULL,
    is_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    order_index INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY uk_application_chart_configs_application_chart (application_id, chart_id),
    KEY idx_application_chart_configs_application_id (application_id),
    KEY idx_application_chart_configs_chart_id (chart_id),
    CONSTRAINT fk_application_chart_configs_application
        FOREIGN KEY (application_id) REFERENCES application(id),
    CONSTRAINT fk_application_chart_configs_chart
        FOREIGN KEY (chart_id) REFERENCES chart_definitions(id)
);