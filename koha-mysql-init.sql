SET @new_AI_borrowers = ( SELECT GREATEST( IFNULL( ( SELECT MAX(borrowernumber) FROM borrowers ), 0 ), IFNULL( ( SELECT MAX(borrowernumber) FROM deletedborrowers ), 0 ) ) + 1 );
SET @sql = CONCAT( 'ALTER TABLE borrowers AUTO_INCREMENT = ', @new_AI_borrowers );
PREPARE st FROM @sql;
EXECUTE st;
 
SET @new_AI_biblio = ( SELECT GREATEST( IFNULL( ( SELECT MAX(biblionumber) FROM biblio ), 0 ), IFNULL( ( SELECT MAX(biblionumber) FROM deletedbiblio ), 0 ) ) + 1 );
SET @sql = CONCAT( 'ALTER TABLE biblio AUTO_INCREMENT = ', @new_AI_biblio );
PREPARE st FROM @sql;
EXECUTE st;
 
SET @new_AI_biblioitems = ( SELECT GREATEST( IFNULL( ( SELECT MAX(biblioitemnumber) FROM biblioitems ), 0 ), IFNULL( ( SELECT MAX(biblioitemnumber) FROM deletedbiblioitems ), 0 ) ) + 1 );
SET @sql = CONCAT( 'ALTER TABLE biblioitems AUTO_INCREMENT = ', @new_AI_biblioitems );
PREPARE st FROM @sql;
EXECUTE st;
 
SET @new_AI_items = ( SELECT GREATEST( IFNULL( ( SELECT MAX(itemnumber) FROM items ), 0 ), IFNULL( ( SELECT MAX(itemnumber) FROM deleteditems ), 0 ) ) + 1 );
SET @sql = CONCAT( 'ALTER TABLE items AUTO_INCREMENT = ', @new_AI_items );
PREPARE st FROM @sql;
EXECUTE st;
 
SET @new_AI_issues = ( SELECT GREATEST( IFNULL( ( SELECT MAX(issue_id) FROM issues ), 0 ), IFNULL( ( SELECT MAX(issue_id) FROM old_issues ), 0 ) ) + 1 );
SET @sql = CONCAT( 'ALTER TABLE issues AUTO_INCREMENT = ', @new_AI_issues );
PREPARE st FROM @sql;
EXECUTE st;
 
SET @new_AI_reserves = ( SELECT GREATEST( IFNULL( ( SELECT MAX(reserve_id) FROM reserves ), 0 ), IFNULL( ( SELECT MAX(reserve_id) FROM old_reserves ), 0 ) ) + 1 );
SET @sql = CONCAT( 'ALTER TABLE reserves AUTO_INCREMENT = ', @new_AI_reserves );
PREPARE st FROM @sql;
EXECUTE st;
