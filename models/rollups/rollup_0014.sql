select
    p0.segment_id as segment_id,
    p2.g2 as r1,
    p0.g1 - p1.g4 as r2
from {{ ref('seg_0021') }} as p0
inner join {{ ref('seg_0052') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0240') }} as p2 on p2.segment_id = p0.segment_id
