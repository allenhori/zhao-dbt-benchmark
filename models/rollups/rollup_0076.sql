select
    p0.segment_id as segment_id,
    p2.g1 + p0.g3 as r1,
    p2.g1 as r2
from {{ ref('seg_0330') }} as p0
inner join {{ ref('seg_0324') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0069') }} as p2 on p2.segment_id = p0.segment_id
