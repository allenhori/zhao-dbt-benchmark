select
    p0.segment_id as segment_id,
    p0.g3 - p1.g2 as r1,
    p2.g2 - p0.g4 as r2
from {{ ref('seg_0216') }} as p0
inner join {{ ref('seg_0352') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0081') }} as p2 on p2.segment_id = p0.segment_id
