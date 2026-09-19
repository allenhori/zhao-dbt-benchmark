select
    p0.segment_id as segment_id,
    p0.g3 as r1,
    p1.r1 as r2,
    p1.r1 as r3
from {{ ref('seg_0034') }} as p0
inner join {{ ref('rollup_0185') }} as p1 on p1.segment_id = p0.segment_id
