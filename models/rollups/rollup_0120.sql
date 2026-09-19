select
    p0.segment_id as segment_id,
    case when p0.g1 > p1.r1 then p0.g1 else p1.r1 end as r1,
    p0.g2 as r2,
    p1.r3 + p0.g3 as r3
from {{ ref('seg_0359') }} as p0
inner join {{ ref('rollup_0035') }} as p1 on p1.segment_id = p0.segment_id
