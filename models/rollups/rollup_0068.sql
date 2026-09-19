select
    p0.segment_id as segment_id,
    p1.r3 + p0.g2 as r1,
    p2.g1 - p0.g1 as r2,
    p2.g2 + p1.r2 as r3,
    p1.r2 + p0.g1 as r4
from {{ ref('seg_0299') }} as p0
inner join {{ ref('rollup_0062') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0353') }} as p2 on p2.segment_id = p0.segment_id
