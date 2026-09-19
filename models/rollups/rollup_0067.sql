select
    p0.segment_id as segment_id,
    p0.g4 as r1,
    p1.g3 as r2
from {{ ref('seg_0203') }} as p0
inner join {{ ref('seg_0397') }} as p1 on p1.segment_id = p0.segment_id
