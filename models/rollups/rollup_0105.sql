select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p1.r2 + p0.g3 as r2,
    p1.r1 as r3
from {{ ref('seg_0281') }} as p0
inner join {{ ref('rollup_0088') }} as p1 on p1.segment_id = p0.segment_id
