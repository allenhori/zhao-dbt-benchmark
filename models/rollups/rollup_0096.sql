select
    p0.segment_id as segment_id,
    p0.g2 as r1,
    p1.r3 + p0.g3 as r2
from {{ ref('seg_0364') }} as p0
inner join {{ ref('rollup_0075') }} as p1 on p1.segment_id = p0.segment_id
