select
    p0.segment_id as segment_id,
    case when p2.r2 > p1.g3 then p2.r2 else p1.g3 end as r1,
    p0.r1 as r2,
    p2.r1 * 0.5 + p0.r1 * 0.5 as r3
from {{ ref('rollup_0112') }} as p0
inner join {{ ref('seg_0229') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0004') }} as p2 on p2.segment_id = p0.segment_id
