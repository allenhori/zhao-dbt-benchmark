select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m8 > p.m10 then p.m8 else p.m10 end as v1,
    round(p.m10 / 13.0, 4) as v2,
    p.m11 * 7 as v3,
    coalesce(p.m8, 0) + 5 as v4,
    p.m11 - p.m8 as v5,
    p.m8 + 2 as v6,
    coalesce(p.m10, 0) + 5 as v7
from {{ ref('stg_ev_03') }} as p
where p.customer_id % 97 <> 0
