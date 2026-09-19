select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 - p.v2 as v1,
    coalesce(p.v3, 0) + 13 as v2,
    p.v3 + 13 as v3,
    case when p.v2 > 1100 then p.v2 else 0 end as v4,
    case when p.v2 > 300 then p.v2 else 0 end as v5,
    round(p.v3 / 13.0, 4) as v6,
    coalesce(p.v2, 0) + 11 as v7
from {{ ref('int_ev_0004') }} as p
