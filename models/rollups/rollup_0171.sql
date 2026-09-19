select
    p0.segment_id as segment_id,
    p0.r2 - p1.g4 as r1,
    p0.r1 as r2,
    p1.g3 + p0.r3 as r3,
    p2.g3 as r4
from {{ ref('rollup_0046') }} as p0
inner join {{ ref('seg_0147') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0281') }} as p2 on p2.segment_id = p0.segment_id
