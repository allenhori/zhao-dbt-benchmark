select
    p0.segment_id as segment_id,
    p1.g2 as r1,
    p1.g3 as r2
from {{ ref('seg_0105') }} as p0
inner join {{ ref('seg_0388') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0085') }} as p2 on p2.segment_id = p0.segment_id
