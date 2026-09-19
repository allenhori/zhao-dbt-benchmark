select
    p0.segment_id as segment_id,
    p1.r2 as r1,
    p1.r3 as r2,
    p1.r2 + p0.g2 as r3
from {{ ref('seg_0246') }} as p0
inner join {{ ref('rollup_0031') }} as p1 on p1.segment_id = p0.segment_id
