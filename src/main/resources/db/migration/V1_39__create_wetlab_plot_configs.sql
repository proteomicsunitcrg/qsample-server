CREATE TABLE wetlab_plot_configs (
    id BIGINT NOT NULL AUTO_INCREMENT,
    wetlab_id BIGINT NOT NULL,
    plot_id BIGINT NOT NULL,
    is_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    order_index INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY uk_wetlab_plot_configs_wetlab_plot (wetlab_id, plot_id),
    KEY idx_wetlab_plot_configs_wetlab_id (wetlab_id),
    KEY idx_wetlab_plot_configs_plot_id (plot_id),
    CONSTRAINT fk_wetlab_plot_configs_wetlab
        FOREIGN KEY (wetlab_id) REFERENCES wetlab(id),
    CONSTRAINT fk_wetlab_plot_configs_plot
        FOREIGN KEY (plot_id) REFERENCES plot(id)
);

INSERT INTO wetlab_plot_configs (
    wetlab_id,
    plot_id,
    is_enabled,
    order_index
)
SELECT
    wet_lab_id AS wetlab_id,
    plot_id,
    TRUE AS is_enabled,
    ROW_NUMBER() OVER (PARTITION BY wet_lab_id ORDER BY plot_id) AS order_index
FROM wetlab_plot;
