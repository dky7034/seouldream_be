-- 1. Add cell_id column to attendances table (if not exists handled by checking or manual execution)
-- Note: JPA ddl-auto: update might have already added the column.
-- ALTER TABLE attendances ADD COLUMN cell_id BIGINT;
-- ALTER TABLE attendances ADD CONSTRAINT fk_attendances_cell FOREIGN KEY (cell_id) REFERENCES cells(id);

-- 2. Backfill existing attendance records with the member's CURRENT cell_id
-- This ensures that historical statistics are based on the current cell structure initially,
-- but will be preserved as 'historical' data from this point onwards.
UPDATE attendances a 
JOIN members m ON a.member_id = m.id 
SET a.cell_id = m.cell_id 
WHERE a.cell_id IS NULL;

-- 3. Verify the update
-- SELECT COUNT(*) FROM attendances WHERE cell_id IS NULL; -- Should be 0 (or count of members without cell)
