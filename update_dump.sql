--
-- Add column to table proposals
--
ALTER TABLE participatoryideation_proposals ADD COLUMN is_from_bo2 int default 0 NOT NULL;
