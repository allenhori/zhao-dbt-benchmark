select
    p0.segment_id as segment_id,
    case when p0.g1 > p1.g3 then p0.g1 else p1.g3 end as r1,
    p0.g2 as r2
from {{ ref('seg_0324') }} as p0
inner join {{ ref('seg_0094') }} as p1 on p1.segment_id = p0.segment_id
