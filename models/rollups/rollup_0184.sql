select
    p0.segment_id as segment_id,
    p0.g3 as r1,
    p0.g3 - p1.g3 as r2,
    p1.g3 as r3
from {{ ref('seg_0294') }} as p0
inner join {{ ref('seg_0146') }} as p1 on p1.segment_id = p0.segment_id
