CREATE OR REPLACE FUNCTION testing2_generate_no_resi()
RETURNS VARCHAR(20)
LANGUAGE plpgsql
AS $$
DECLARE
    v_nomor VARCHAR(20);
BEGIN
    v_nomor :=
        'P'
        || TO_CHAR(CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Jakarta', 'YYMMDD')
        || LPAD(NEXTVAL('seq_no_resi')::TEXT, 6, '0');

    RETURN v_nomor;
END;
$$;
