select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m1 / 5.0, 4) as v1,
    case when p.m4 > 1100 then p.m4 else 0 end as v2,
    p.m5 - p.m1 as v3,
    round(p.m5 / 2.0, 4) as v4,
    case when p.m5 > p.m4 then p.m5 else p.m4 end as v5,
    round(p.m5 / 7.0, 4) as v6
from {{ ref('stg_ev_04') }} as p
