select
    p0.segment_id as segment_id,
    case when p0.r1 > p1.g1 then p0.r1 else p1.g1 end as r1,
    p1.g1 * 0.5 + p2.g1 * 0.5 as r2
from {{ ref('rollup_0121') }} as p0
inner join {{ ref('seg_0214') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0191') }} as p2 on p2.segment_id = p0.segment_id
