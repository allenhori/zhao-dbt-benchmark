select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m4, 0) + 13 as v1,
    case when p.m4 > 300 then p.m4 else 0 end as v2,
    coalesce(p.m4, 0) + 13 as v3,
    p.m4 * 11 as v4,
    p.m4 - p.m1 as v5,
    p.m4 + 11 as v6,
    p.m4 + 2 as v7,
    p.m4 + 3 as v8
from {{ ref('stg_ev_05') }} as p
where p.customer_id % 97 <> 0
