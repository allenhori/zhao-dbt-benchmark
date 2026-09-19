select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m1 > 300 then p.m1 else 0 end as v1,
    round(p.m5 / 11.0, 4) as v2,
    p.m1 + 5 as v3,
    p.m5 + p.m1 as v4,
    coalesce(p.m5, 0) + 2 as v5,
    p.m5 + p.m1 as v6
from {{ ref('stg_ev_05') }} as p
