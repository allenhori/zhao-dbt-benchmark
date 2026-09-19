select
    p0.segment_id as segment_id,
    p2.r2 as r1,
    case when p1.g1 > p0.r2 then p1.g1 else p0.r2 end as r2
from {{ ref('rollup_0039') }} as p0
inner join {{ ref('seg_0126') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0034') }} as p2 on p2.segment_id = p0.segment_id
