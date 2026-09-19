select
    p0.segment_id as segment_id,
    p0.r3 as r1,
    p1.g1 as r2,
    p1.g4 as r3,
    p1.g1 as r4
from {{ ref('rollup_0024') }} as p0
inner join {{ ref('seg_0065') }} as p1 on p1.segment_id = p0.segment_id
