select
    p0.segment_id as segment_id,
    p1.r4 as r1,
    p0.r1 as r2,
    p0.r1 - p1.r3 as r3
from {{ ref('rollup_0099') }} as p0
inner join {{ ref('rollup_0158') }} as p1 on p1.segment_id = p0.segment_id
