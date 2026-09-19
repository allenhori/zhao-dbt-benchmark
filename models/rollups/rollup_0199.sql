select
    p0.segment_id as segment_id,
    p1.g2 as r1,
    p1.g3 - p0.r3 as r2
from {{ ref('rollup_0091') }} as p0
inner join {{ ref('seg_0147') }} as p1 on p1.segment_id = p0.segment_id
