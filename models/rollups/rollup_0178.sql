select
    p0.segment_id as segment_id,
    p2.g4 as r1,
    p2.g1 as r2
from {{ ref('seg_0275') }} as p0
inner join {{ ref('seg_0036') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0390') }} as p2 on p2.segment_id = p0.segment_id
