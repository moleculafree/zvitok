-- Виправлення: позначити записи, які не були пройдені старим кодом
-- (старий код маркував лише id = parentId OR parent_id = parentId, не враховував всіх дітей)

WITH RECURSIVE orphan_descendants(id) AS (
    SELECT id FROM ZVIT WHERE deleted = 1
    UNION ALL
    SELECT z.id FROM ZVIT z
    JOIN orphan_descendants od ON z.parent_id = od.id
    WHERE z.deleted = 0
)
UPDATE ZVIT
SET deleted = 1, deleted_at = datetime('now', 'localtime')
WHERE id IN (SELECT id FROM orphan_descendants)
  AND deleted = 0;