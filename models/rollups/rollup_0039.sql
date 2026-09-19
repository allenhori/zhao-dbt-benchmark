select
    p0.segment_id as segment_id,
    p0.g1 * 0.5 + p1.r3 * 0.5 as r1,
    p1.r1 as r2
from {{ ref('seg_0281') }} as p0
inner join {{ ref('rollup_0025') }} as p1 on p1.segment_id = p0.segment_id
