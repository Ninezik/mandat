CREATE TABLE testing2_fakta_pengiriman_history (
    id_history BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    no_resi VARCHAR(20) NOT NULL,
    id_status VARCHAR(10) NOT NULL,
    waktu_status TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    id_pegawai_proses VARCHAR(10) NOT NULL,
    id_kantor VARCHAR(10) NOT NULL,
    keterangan TEXT,
    FOREIGN KEY (no_resi) REFERENCES testing2_fakta_pengiriman(no_resi),
    FOREIGN KEY (id_status) REFERENCES dim_status_pengiriman(id_status),
    FOREIGN KEY (id_pegawai_proses) REFERENCES dim_pegawai(id_pegawai),
    FOREIGN KEY (id_kantor) REFERENCES dim_kantor(id_kantor)
);
