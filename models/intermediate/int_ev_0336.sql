select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m10 * 7 as v1,
    case when p.m10 > p.m8 then p.m10 else p.m8 end as v2,
    case when p.m10 > p.m8 then p.m10 else p.m8 end as v3,
    p.m10 + 2 as v4,
    p.m8 + 5 as v5,
    round(p.m8 / 3.0, 4) as v6,
    coalesce(p.m10, 0) + 5 as v7,
    p.m10 * 2 as v8
from {{ ref('stg_ev_05') }} as p
