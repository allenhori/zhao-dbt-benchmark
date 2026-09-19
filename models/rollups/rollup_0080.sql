select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p2.g3 - p0.g3 as r2,
    p1.r4 * 0.5 + p2.g2 * 0.5 as r3
from {{ ref('seg_0277') }} as p0
inner join {{ ref('rollup_0026') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0258') }} as p2 on p2.segment_id = p0.segment_id
