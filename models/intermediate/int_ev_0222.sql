select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v3 / 5.0, 4) as v1,
    coalesce(p.v2, 0) + 3 as v2,
    case when p.v3 > 500 then p.v3 else 0 end as v3,
    coalesce(p.v3, 0) + 2 as v4,
    round(p.v3 / 5.0, 4) as v5,
    round(p.v3 / 11.0, 4) as v6,
    coalesce(p.v3, 0) + 11 as v7,
    case when p.v6 > p.v3 then p.v6 else p.v3 end as v8
from {{ ref('int_ev_0019') }} as p
