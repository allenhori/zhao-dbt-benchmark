select
    p0.segment_id as segment_id,
    p1.r2 as r1,
    p0.g2 as r2,
    p0.g2 as r3
from {{ ref('seg_0263') }} as p0
inner join {{ ref('rollup_0014') }} as p1 on p1.segment_id = p0.segment_id
