select
    p0.segment_id as segment_id,
    p1.g2 + p0.r3 as r1,
    case when p0.r4 > p1.g1 then p0.r4 else p1.g1 end as r2
from {{ ref('rollup_0099') }} as p0
inner join {{ ref('seg_0341') }} as p1 on p1.segment_id = p0.segment_id
