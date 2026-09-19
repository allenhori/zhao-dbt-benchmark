select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v1,
    p.v2 - p.v1 as v2,
    round(p.v2 / 2.0, 4) as v3,
    p.v2 + p.v1 as v4,
    case when p.v1 > 1100 then p.v1 else 0 end as v5,
    coalesce(p.v1, 0) + 3 as v6
from {{ ref('int_ev_0288') }} as p
