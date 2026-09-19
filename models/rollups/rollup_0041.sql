select
    p0.segment_id as segment_id,
    p0.g4 as r1,
    p0.g1 as r2,
    case when p1.r3 > p0.g1 then p1.r3 else p0.g1 end as r3
from {{ ref('seg_0361') }} as p0
inner join {{ ref('rollup_0006') }} as p1 on p1.segment_id = p0.segment_id
