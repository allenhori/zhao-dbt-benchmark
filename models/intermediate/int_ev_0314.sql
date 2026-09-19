select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m1 - p.m10 as v1,
    p.m10 + 3 as v2,
    case when p.m10 > p.m8 then p.m10 else p.m8 end as v3,
    round(p.m1 / 11.0, 4) as v4,
    case when p.m8 > 500 then p.m8 else 0 end as v5,
    round(p.m10 / 5.0, 4) as v6
from {{ ref('stg_ev_00') }} as p
