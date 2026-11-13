CREATE OR REPLACE FUNCTION testing2_buat_pengiriman(
    p_id_pegawai_pembuat_kantor_asal VARCHAR(10),
    p_id_user VARCHAR(100),
    p_nama_pengirim TEXT,
    p_no_hp_pengirim VARCHAR(15),
    p_alamat_detail_pengirim TEXT,
    p_id_layanan VARCHAR(20),
    p_id_tarif INT,
    p_berat_gram INT,
    p_berat_dikenakan INT,
    p_total_tarif NUMERIC(14,2),
    p_id_tipe_pembayaran VARCHAR(10),
    p_id_kabkota_pengirim INT,
    p_id_kantor_pengirim VARCHAR(10),
    p_id_kabkota_penerima INT,
    p_id_kantor_penerima VARCHAR(10),
    p_id_mitra VARCHAR(10),
    p_nama_penerima TEXT,
    p_no_hp_penerima VARCHAR(15),
    p_alamat_detail_penerima TEXT
)
RETURNS VARCHAR(20)
LANGUAGE plpgsql
AS $$
DECLARE
    v_no_resi VARCHAR(20);
BEGIN
    INSERT INTO testing2_fakta_pengiriman (
        id_pegawai_pembuat_kantor_asal,
        id_user,
        nama_pengirim,
        no_hp_pengirim,
        alamat_detail_pengirim,
        id_layanan,
        id_tarif,
        berat_gram,
        berat_dikenakan,
        total_tarif,
        id_tipe_pembayaran,
        id_kabkota_pengirim,
        id_kantor_pengirim,
        id_kabkota_penerima,
        id_kantor_penerima,
        id_mitra,
        id_status_terakhir,
        nama_penerima,
        no_hp_penerima,
        alamat_detail_penerima
    )
    VALUES (
        p_id_pegawai_pembuat_kantor_asal,
        p_id_user,
        p_nama_pengirim,
        p_no_hp_pengirim,
        p_alamat_detail_pengirim,
        p_id_layanan,
        p_id_tarif,
        p_berat_gram,
        p_berat_dikenakan,
        p_total_tarif,
        p_id_tipe_pembayaran,
        p_id_kabkota_pengirim,
        p_id_kantor_pengirim,
        p_id_kabkota_penerima,
        p_id_kantor_penerima,
        p_id_mitra,
        'ST01',
        p_nama_penerima,
        p_no_hp_penerima,
        p_alamat_detail_penerima
    )
    RETURNING no_resi INTO v_no_resi;

    INSERT INTO testing2_fakta_pengiriman_history (
        no_resi,
        id_status,
        id_pegawai_proses,
        id_kantor,
        keterangan
    )
    VALUES (
        v_no_resi,
        'ST01',
        p_id_pegawai_pembuat_kantor_asal,
        p_id_kantor_pengirim,
        'Transaksi pengiriman dibuat'
    );
    RETURN v_no_resi;

END;
$$;
