select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v8 > 1300 then p.v8 else 0 end as v1,
    round(p.v3 / 13.0, 4) as v2,
    case when p.v8 > p.v3 then p.v8 else p.v3 end as v3,
    p.v8 + 13 as v4,
    p.v3 - p.v8 as v5,
    coalesce(p.v3, 0) + 3 as v6
from {{ ref('int_ev_0024') }} as p
