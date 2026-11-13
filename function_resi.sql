CREATE OR REPLACE FUNCTION testing2_generate_no_resi()
RETURNS VARCHAR(20)
LANGUAGE plpgsql
AS $$
DECLARE
    v_nomor BIGINT;
BEGIN
    v_nomor := NEXTVAL('testing2_seq_no_resi');

    RETURN
        'P'
        || TO_CHAR(
            CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Jakarta',
            'YYMMDD'
        )
        || LPAD(
            v_nomor::TEXT,
            GREATEST(6, LENGTH(v_nomor::TEXT)),
            '0'
        );
END;
$$;
