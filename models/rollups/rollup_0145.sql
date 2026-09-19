select
    p0.segment_id as segment_id,
    p1.r2 - p0.r1 as r1,
    p1.r2 as r2,
    p1.r2 as r3,
    p0.r2 * 0.5 + p1.r1 * 0.5 as r4
from {{ ref('rollup_0059') }} as p0
inner join {{ ref('rollup_0057') }} as p1 on p1.segment_id = p0.segment_id
