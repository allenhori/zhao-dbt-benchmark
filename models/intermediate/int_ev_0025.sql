select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m1 > p.m12 then p.m1 else p.m12 end as v1,
    p.m12 + 2 as v2,
    case when p.m1 > 500 then p.m1 else 0 end as v3,
    coalesce(p.m12, 0) + 2 as v4,
    coalesce(p.m9, 0) + 5 as v5,
    p.m9 + 2 as v6,
    p.m9 + 2 as v7
from {{ ref('stg_ev_07') }} as p
