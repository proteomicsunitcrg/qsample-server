CREATE TABLE wetlab_chart_configs (
    id BIGINT NOT NULL AUTO_INCREMENT,
    wetlab_id BIGINT NOT NULL,
    chart_id BIGINT NOT NULL,
    is_enabled TINYINT(1) NOT NULL DEFAULT 1,
    order_index INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY uk_wetlab_chart_configs_wetlab_chart (wetlab_id, chart_id),
    KEY idx_wetlab_chart_configs_wetlab_id (wetlab_id),
    KEY idx_wetlab_chart_configs_chart_id (chart_id),
    CONSTRAINT fk_wetlab_chart_configs_wetlab
        FOREIGN KEY (wetlab_id) REFERENCES wetlab (id),
    CONSTRAINT fk_wetlab_chart_configs_chart
        FOREIGN KEY (chart_id) REFERENCES chart_definitions (id)
);
