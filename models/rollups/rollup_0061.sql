select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p1.g1 as r2,
    p1.g1 as r3
from {{ ref('seg_0001') }} as p0
inner join {{ ref('seg_0054') }} as p1 on p1.segment_id = p0.segment_id
